package utils.config;

import org.apache.log4j.Logger;
import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;
import org.jasypt.properties.EncryptableProperties;
import utils.testrail.Constants;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URL;
import java.util.Properties;

public class ConfigManager {
    private final Logger logger = Logger.getLogger(this.getClass());

    public Properties loadProperties() throws IOException {
        StandardPBEStringEncryptor encryption = new StandardPBEStringEncryptor();
        encryption.setPassword("getfromkeyvault");
        Properties properties = new EncryptableProperties(encryption);
        String configFile = getConfigFilePath();
        FileInputStream fileInputStream = new FileInputStream(configFile);
        properties.load(fileInputStream);
        return properties;
    }

    private String getConfigFilePath() throws FileNotFoundException {
        ClassLoader classLoader = this.getClass().getClassLoader();
        URL url = classLoader.getResource(Constants.CONFIG_FILE);
        if (url == null) {
            logger.error("There is no configuration file!");
            throw new FileNotFoundException();
        }
        return url.getPath();
    }
}
