Feature: To create a book in library

  Background: Set the base url
    Given url "http://localhost:9191"
    When path "/normal/webapi/add"
    
    # @POSTJOB
  Scenario: Create a data using POST request and vaidate the response
    And request  {"jobId":3,"jobTitle":"Quality Engineering","jobDescription":"To test flutter application","experience":["Google","Apple","Mobile Iron","Appium"],"project":[{"projectName":"E-Commerce App","technology":["Kotlin","SQL Lite","Gradle","C++"]}]}
    And headers {Accept: "application/json",Content-Type:"application/json"}
    When method post
    Then status 201

    @POSTJOB
  Scenario: Create a data using POST request using external files and vaidate the response
    * def postData = read("data/createJobData.json")
    And request  postData
    And headers {Accept: "application/json",Content-Type:"application/json"}
    When method post
    Then status 201

    @embedded
  Scenario: Create a data using POST request using embedded expression and vaidate the response
    * def jobId = function(){return Math.floor((100)* Math.random());}
    And request  {"jobId":'#(jobId())',"jobTitle":"Quality Engineering","jobDescription":"To test flutter application","experience":["Google","Apple","Mobile Iron","Appium"],"project":[{"projectName":"E-Commerce App","technology":["Kotlin","SQL Lite","Gradle","C++"]}]}
    And headers {Accept: "application/json",Content-Type:"application/json"}
    When method post
    Then status 201