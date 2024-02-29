Feature: Update partial data of any job entry using patch method

  Background: do basic setup and call usable code here
    Given url "http://localhost:9191"
    * def randomInteger = function(){return Math.floor((100)* Math.random());}
    * def ints = randomInteger()

    @POSITIVEFLOW
  Scenario: Create a new entry using POST method then update its data using PATCH method
    * def createJob = call read("../helperFeatureFileWithVariables.feature") {_url: "http://localhost:9191",_path: "/normal/webapi/add",_id: "#(ints)" }
    # patch request
    * def jobDecrip = "Making tester test app in every aspects"
    Given path '/normal/webapi/update/details'
    And params {id : "#(ints)", jobTitle: "Chemical Engineering", jobDescription : "#(jobDecrip)"}
    And header Accept = "application/json"
    And request {}
    When method patch
    Then status 200
    And match response.jobDescription == jobDecrip

    @IDNOTEXIST
  Scenario: Create a new entry using POST method then update its data using PATCH method and assert if wrong ID is provided
    * def createJob = call read("../helperFeatureFileWithVariables.feature") {_url: "http://localhost:9191",_path: "/normal/webapi/add",_id: "#(ints)" }
    # patch request
    * def jobDecrip = "Making tester test app in every aspects"
    Given path '/normal/webapi/update/details'
    And params {id : 2987, jobTitle: "Chemical Engineering", jobDescription : "#(jobDecrip)"}
    And header Accept = "application/json"
    And request {}
    When method patch
    Then status 404
    And match response.message == "Failed to find job with id=2987"

  @JOIDNOTEXIST
  Scenario: Create a new entry using POST method then update its data using PATCH method and assert any param is missing
    * def createJob = call read("../helperFeatureFileWithVariables.feature") {_url: "http://localhost:9191",_path: "/normal/webapi/add",_id: "#(ints)" }
    # patch request
    * def jobDecrip = "Making tester test app in every aspects"
    Given path '/normal/webapi/update/details'
    And params {id : "#(ints)", jobDescription : "#(jobDecrip)"}
    And header Accept = "application/json"
    And request {}
    When method patch
    Then status 400
    And match response.message == "Required String parameter 'jobTitle' is not present"
    And match response.error == "Bad Request"

