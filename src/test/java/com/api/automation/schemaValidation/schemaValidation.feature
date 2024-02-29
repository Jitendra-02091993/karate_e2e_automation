Feature:Performing schema Validation from basic to complex schema using embedded expression and fuzzy matcher

  Background: Set the base url
    Given url "http://localhost:9191"
    

    @TC_01_Schema
  Scenario: To create the data using POST method and validate the Schema
    And path "/normal/webapi/add"
    * def body = read("data/schemaData.json")
    And request body
    And headers {Accept:"application/json", Content-Type:"application/json"}
    When method post
    Then status 201
    And match response == 
    """
        {
      "jobId" : '#number',
      "jobTitle": '#string',
      "jobDescription": '#string',
      "experience": '#[] #string',
      "project": '#[] #object'
    }
    """
    @TC_02_Schema
  Scenario: To fetch the data using GET method and validate the complex Schema using embedded expression and fuzzy matcher
    And path "/normal/webapi/all"
    And headers {Accept:"application/json"}
    When method get
    Then status 200
    * def projectSchema = {"projectName" : '#string',"technology":'#[] #string'}
    * def mainSchema = {"jobId":'#number',"jobTitle":'#string',"jobDescription":'#string',"experience":'#[] #string',"project":'#[] ##(projectSchema)'}
    And match response == 
    """
    '#[] ##(mainSchema)'
    """
