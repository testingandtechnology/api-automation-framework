package runner;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import cucumber.api.CucumberOptions;
import org.junit.After;
import org.junit.Test;
import utils.testrail.Constants;
import utils.testrail.exceptions.NoTestRailUrlException;
import utils.testrail.exceptions.ProjectNotFoundException;
import utils.testrail.handlers.TestRailIntegrationImp;

import java.io.IOException;

import static junit.framework.TestCase.assertEquals;

/**
 * @author Thanh Le
 * Created: 28 Nov 2019
 */

@CucumberOptions(features = "classpath:features/", tags = {"~@ignore"})
public class TestRunner {
    @Test
    public void testParallel() {
        Results results = Runner.parallel(getClass(), 5, "out/surefire-reports");
        assertEquals(results.getErrorMessages(), 0, results.getFailCount());
    }

    @After
    public void updateTestRail() throws ProjectNotFoundException, NoTestRailUrlException, IOException {
        if (System.getenv(Constants.UPDATE_TESTRAIL)!=null && System.getenv(Constants.UPDATE_TESTRAIL).equalsIgnoreCase("yes")) {
            TestRailIntegrationImp imp = new TestRailIntegrationImp();
            imp.execute();
        }
    }
}
