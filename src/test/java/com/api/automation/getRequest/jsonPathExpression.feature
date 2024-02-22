Feature: To use the JSON path expression
  Background: Set the base url
    Given url "http://localhost:9191"
    And path "/normal/webapi/all"

    @TC_01_PathExpression
  Scenario: To get the value of property using the json path expression
    When method get
    Then status 200
    # karate.jsonPath(doc,jsonPathExpression)
    * def jobId = 1
    * def jobTitle = karate.jsonPath(response, "$[?(@.jobId=="+jobId+")].jobTitle")  
    Then print "JobTitle is--->", jobTitle
    And match jobTitle == "#[]"

    * def projectName = karate.jsonPath(response, "$[?(@.jobId == "+jobId+")].project[0].projectName")
    Then print "movie name is--->" + projectName 
    And match projectName == "#[]"
