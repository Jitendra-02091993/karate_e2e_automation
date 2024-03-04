package com.api.automation;

public class readSystemProperty {
	
	public static void main(String[] args) {
		System.out.println("Location" + System.getProperty("locations", "com/api/automation"));
		System.out.println("tags" + System.getProperty("tags", "@POSTJOB"));

	}

}
