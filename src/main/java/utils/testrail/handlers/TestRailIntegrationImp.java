package utils.testrail.handlers;

import com.codepine.api.testrail.model.Case;
import com.codepine.api.testrail.model.Project;
import com.codepine.api.testrail.model.Run;
import org.apache.log4j.Logger;
import utils.config.ConfigManager;
import utils.testrail.Constants;
import utils.testrail.exceptions.NoTestRailUrlException;
import utils.testrail.exceptions.ProjectNotFoundException;
import utils.testrail.report.ReportProcessor;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

import static utils.testrail.Constants.*;

/**
 * @author Thanh Le
 * Created: 04 Dec 2019
 */
public class TestRailIntegrationImp {
    private TestRailConnector testRailConnector;
    private static Logger logger = Logger.getLogger(TestRailIntegrationImp.class);
    private Properties properties;

    public TestRailIntegrationImp() throws IOException {
        ConfigManager configManager = new ConfigManager();
        this.properties = configManager.loadProperties();
    }

    public void execute() throws ProjectNotFoundException, NoTestRailUrlException {
        ReportProcessor reportProcessor = new ReportProcessor();
        HashMap<String, HashMap<String, Object>> reports = reportProcessor.analyseReports();
        if (reports.isEmpty()) {
            logger.info("No report!");
            return;
        }

        if (getCredential() == null) {
           logger.info("No TestRail credentials provided! Skip updating TestRail");
            return;
        }

        testRailConnector = new TestRailConnector(properties.getProperty(TESTRAIL_URL), getCredential());

        Project project = testRailConnector.getProject(properties.getProperty(Constants.PROJECT_NAME));
        String testRunName = getTestRunName();
        Run run = getExpectedRun(project, testRunName);
        if (run == null) {
            run = testRailConnector.createTestRun(project, testRunName);
        }

        for (Map.Entry<String, HashMap<String, Object>> entry : reports.entrySet()) {
            String testCaseId = entry.getKey();
            HashMap<String, Object> testCaseResult = entry.getValue();

            String values = testCaseResult.get("result").toString().replaceAll("[{}]", "");
            String[] valuesArray = values.split("\\W+");

            String message = "";
            String status = "";

            for (int count = 0; count <= valuesArray.length - 1; count++) {
                if ((valuesArray[count].equals("message")) && (valuesArray[count + 1].equals("status"))) {
                    count += 1;
                } else {
                    message = valuesArray[count + 1];
                }

                if (valuesArray[count].equals("status")) {
                    status = valuesArray[count + 1];
                    break;
                }
            }

            Case testCase = testRailConnector.getTestCaseById(project, Integer.parseInt(testCaseId));
            testRailConnector.addTestCaseToTestRun(run, Integer.parseInt(testCaseId));
            testRailConnector.addTestResult(run, testCase, status);
        }
    }

    private Credential getCredential() {
        if (properties.getProperty(TESTRAIL_PASS) == null || properties.getProperty(TESTRAIL_USER) == null)
            return null;
        return new Credential(properties.getProperty(TESTRAIL_USER),properties.getProperty(TESTRAIL_PASS));
    }

    private Run getExpectedRun(Project project, String testRunName) {
        List<Run> runs = testRailConnector.getRuns(project);
        for (Run run : runs) {
            if (run.getName().trim().equalsIgnoreCase(testRunName)) {
                return run;
            }
        }
        return null;
    }


    private String getTestRunName() {
        String buildNumber = System.getenv(BUILD_NUMBER);
        logger.info("Build number "+buildNumber);
        if (buildNumber == null || buildNumber.isEmpty()) {
            return properties.getProperty(DEFAULT_PREFIX) + " " + defaultTestRunName();
        } else {
            return properties.getProperty(DEFAULT_PREFIX) + " " + buildNumber;
        }
    }

    private String defaultTestRunName() {
        final Date now = new Date();
        final SimpleDateFormat formatter = new SimpleDateFormat(properties.getProperty(DATETIME_FORMAT));
        return formatter.format(now);
    }

}
