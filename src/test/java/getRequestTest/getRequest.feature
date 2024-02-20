Feature: To test that data is getting fetch from the DB using GET request in JSON and XML format

  Background: Set the base url
    Given url "http://localhost:9191"

    @JSONFormat
  Scenario:To get all the data from app in JSON format
    Given path "/normal/webapi/all"
    # Given url "http://localhost:9191/normal/webapi/all"
    And header Accept = "application/json"
    When method get
    Then status 200
    * def data = response[0].project[0].technology[2]
    And print "----------------------------------------------------", data
    And match response contains deep {"jobTitle": "Software Engg"}
    Then print karate.pretty(response)


    @XMLFormat
  Scenario:To get all the data from app in XML format
    Given path "/normal/webapi/all"
    # Given url "http://localhost:9191/normal/webapi/all"
    And header Accept = "application/xml"
    When method get
    Then status 200
    And match response/List/item[1]/jobTitle == "Software Engg"
    And match /List/item[1]/experience/experience[3] == "Mobile Iron"
    And match response.List.item.experience.experience[2] == "Mobile Iron"
    # And match response contains deep "jobTitle": "Software Engg"
    Then print karate.pretty(response)
