Feature:To validate JSON response from file

  Background: Set the base url
    Given url "http://localhost:9191"

  @FileJSON
  Scenario:To get response in JSON format using GET method and validate response using external file
    Given path "/normal/webapi/all"
    And param jobId = 1
    And header Accept = "application/json"
    When method get
    Then status 200
    * def actualResponse = read("../jsonResponse.json")
    Then print "Files response are:-------", actualResponse
    # And match response == actualResponse

