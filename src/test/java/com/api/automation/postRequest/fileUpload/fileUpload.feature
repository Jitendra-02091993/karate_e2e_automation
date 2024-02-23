Feature: To upload the file using karate framework

  Background: Set the base url
    Given url "http://localhost:9191"
    When path "/normal/webapi/upload"

    @TC_01
  Scenario: To uplod the file in the test application
    #location of file, name of file, content-type
    * def fileLocation = "dummy.txt"
    And multipart file file = {read:"#(fileLocation)", filename: "dummy.txt", Content-Type: "multipart/form-data"}
    When method post
    Then status 200
    And print response

    @TC_02
  Scenario: To uplod the file in the test application
    #location of file, name of file, content-type
    * def fileLocation = "../data/createJobData.json"
    And multipart file file = {read:"#(fileLocation)", filename: "createJobData.json", Content-Type: "multipart/form-data"}
    When method post
    Then status 200
    And print response
    And match response.message contains "createJobData.json"