Feature: To create a data in application using external files

  Background: Set the base url
    * def dataFile = read('excelFile.csv')
    Given url "http://localhost:9191"
    When path "/normal/webapi/add"


    @TC_ScenarioOutline
  Scenario Outline: Create a data using POST request and vaidate the response <jobId>
    And request  {"jobId":'#(jobId)',"jobTitle":'#(jobTitle)',"jobDescription":'#(jobDescription)',"experience":["Google","Apple","Mobile Iron","Appium"],"project":[{"projectName":"E-Commerce App","technology":["Kotlin","SQL Lite","Gradle","C++"]}]}
    And headers {Accept: "application/json",Content-Type:"application/json"}
    When method post
    Then status <status>

    Examples:
      |jobId|jobTitle|jobDescription|status|
      |12|Quality Engineering|To test flutter application|201|
      |id|Quality Engineering|To test flutter application|400|
      |false|Quality Engineering|To test flutter application|400|

    @TC_ScenarioOutline_ExternalFiles
  Scenario Outline: Create a data using POST request and vaidate the response using external files <jobId>
    * def jobId1 = function(){return Math.floor((100)* Math.random());}
    And request  {"jobId": '#(jobId1())',"jobTitle":<jobTitle>,"jobDescription":'#(jobDescription)',"experience":["Google","Apple","Mobile Iron","Appium"],"project":[{"projectName":"E-Commerce App","technology":["Kotlin","SQL Lite","Gradle","C++"]}]}
    And headers {Accept: "application/json",Content-Type:"application/json"}
    When method post
    Then status <status>
    And print response
    Then print "values are------------?> <jobId>"


    Examples:
      |read('excelFile.csv')|
  


