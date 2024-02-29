Feature: To test that data is getting fetch from the DB using GET request in JSON and XML format

  Background: Set the base url
    Given url "http://localhost:9191"
    And path "/normal/webapi/all"

    @JSONFormat
  Scenario:To get all the data from app in JSON format
    And param jobId = 1
    And header Accept = "application/json"
    When method get
    Then status 200
    * def data = response[0].project[0].technology[2]
    And print "----------------------------------------------------", data
    And match response contains deep {"jobTitle": "Software Engg"}
    Then print karate.pretty(response)
    # And assert response.length == 1
    And match response == "#array"
        #-----------Validation of size of an array-----------
    And match response[0].experience == "#[3]"
      #-------------Validation Using wild card (*)-----------
    And match response[*] contains {"jobId": "#number","jobTitle": "#string","jobDescription": "#string","experience":"#[] #string" ,"project":"#[] #object"}
    # Use contain if there is need to assert specific value from the array or body
    And match response[0].experience[*] contains ["Apple"]  
    # Use == if exact value need to verify
    And match response[0].experience[*] == ["Google","Apple","Mobile Iron"]



    @XMLFormat
  Scenario:To get all the data from app in XML format
    # Given url "http://localhost:9191/normal/webapi/all"
    And header Accept = "application/xml"
    When method get
    Then status 200
    And match response/List/item[1]/jobTitle == "Software Engg"
    And match /List/item[1]/experience/experience[3] == "Mobile Iron"
    And match response.List.item.experience.experience[2] == "Mobile Iron"
    # And match response contains deep "jobTitle": "Software Engg"
    Then print karate.pretty(response)
