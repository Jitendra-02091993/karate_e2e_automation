Feature: To verify the data can be modified in a json using PUT request

  Background: 
    Given url "http://localhost:9191"
    * def randomInteger = function(){return Math.floor((100)* Math.random());}
    * def ints = randomInteger()

    @PUT
  Scenario:Create an entry using POST method and then Update any data in a JSON by using PUT method
    When path "/normal/webapi/add"
    When request {"jobId":'#(ints)',"jobTitle":"Chemical Engineering","jobDescription":"To test chemical content","experience":["Google","Apple","Mobile Iron","Appium"],"project":[{"projectName":"E-Commerce App","technology":["Kotlin","SQL Lite","Gradle","C++"]}]}
    And headers {Accept: "application/json", Content-Type: "application/json"}
    When method post
    And status 201
    Given path "/normal/webapi/update"
    When request  {"jobId":'#(ints)',"jobTitle":"Tester Engineering","jobDescription":"To develop flutter application","experience":["Google","Apple","Mobile Iron","Appium"],"project":[{"projectName":"E-Commerce App","technology":["Kotlin","SQL Lite","Gradle","D++"]},{"projectName":"Banking Domain","technology":["Rupees","Thai","Currency"]}]}
    And headers {Accept: "application/json", Content-Type: "application/json"}
    When method put
    Then status 200
    * def projectArray = karate.jsonPath(response, "$[?(@.jobId == "+ ints +")].project")
    And print "array size---------->",projectArray
    And match projectArray[0] == '#[2]'

    @PUTRead
  Scenario:Create an entry using POST method and then Update any data in a JSON by using PUT method from readable files
    Given call read("../helperFeatureFile.feature")
    Given path "/normal/webapi/update"
    When request  {"jobId":'201',"jobTitle":"Tester Engineering","jobDescription":"To develop flutter application","experience":["Google","Apple","Mobile Iron","Appium"],"project":[{"projectName":"E-Commerce App","technology":["Kotlin","SQL Lite","Gradle","D++"]},{"projectName":"Banking Domain","technology":["Rupees","Thai","Currency"]}]}
    And headers {Accept: "application/json", Content-Type: "application/json"}
    When method put
    Then status 200
    # using jsonPathWay to validate.
    * def projectArray = karate.jsonPath(response, "$[?(@.jobId == 201)].project")
    And print "array size---------->",projectArray
    And match projectArray[0] == '#[2]'

    @PUTReadVariables
  Scenario:Create an entry using POST method and then Update any data in a JSON by using PUT method from readable files
    * def varValues = call read("../helperFeatureFile.feature")
    And print "randomInteger--->", varValues.randomInteger()
    And print "randomInteger--->", varValues.ints
    And print "jobID---------->", varValues.dataJobId

    Given path "/normal/webapi/update"
    When request  {"jobId":'#(varValues.ints)',"jobTitle":"Tester Engineering","jobDescription":"To develop flutter application","experience":["Google","Apple","Mobile Iron","Appium"],"project":[{"projectName":"E-Commerce App","technology":["Kotlin","SQL Lite","Gradle","D++"]},{"projectName":"Banking Domain","technology":["Rupees","Thai","Currency"]}]}
    And headers {Accept: "application/json", Content-Type: "application/json"}
    When method put
    Then status 200
    * def projectArray = karate.jsonPath(response, "$[?(@.jobId == "+varValues.ints+")].project")
    And print "array size---------->",projectArray
    And match projectArray[0] == '#[2]'

    @Helper
    Scenario: To update the data forexisting job in JSON format by calling another feature files with variables
      * def helper = call read("../helperFeatureFileWithVariables.feature") {_url:"http://localhost:9191", _path:"/normal/webapi/add",_id: '#(ints)' }


