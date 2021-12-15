package dataProvider;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

public class ConfigFileReader {
	
	private Properties properties;
	private final String propertyFilePath= "configs//Configuration.properties";

	
	public ConfigFileReader(){
		BufferedReader reader;
		try {
			reader = new BufferedReader(new FileReader(propertyFilePath));
			properties = new Properties();
			try {
				properties.load(reader);
				reader.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			throw new RuntimeException("Configuration.properties not found at " + propertyFilePath);
		}		
	}
	public String getBaseUrl() {
		String url = properties.getProperty("BaseURL");
		if(url != null) return url;
		else throw new RuntimeException("Bser url not specified in the Configuration.properties file.");
	}
	public String getAccountID() {
		String url = properties.getProperty("accountid");
		if(url != null) return url;
		else throw new RuntimeException("accountid not specified in the Configuration.properties file.");
	}
	public String getTenantID() {
		String url = properties.getProperty("tenantid");
		if(url != null) return url;
		else throw new RuntimeException("tenantid not specified in the Configuration.properties file.");
	}
	public String getPublicKey() {
		String url = properties.getProperty("publickey");
		if(url != null) return url;
		else throw new RuntimeException("publickey not specified in the Configuration.properties file.");
	}
	public String getPrivateKey() {
		String url = properties.getProperty("privatekey");
		if(url != null) return url;
		else throw new RuntimeException("privatekey not specified in the Configuration.properties file.");
	}
}
