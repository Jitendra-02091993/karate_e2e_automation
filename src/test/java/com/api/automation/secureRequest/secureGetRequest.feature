Feature:Check the app security by passing username and password

  Background: Do the Base url setup
    Given url "http://localhost:9191"

    @Secure_TC_01
  Scenario:Check the positive flow of fetching data by providing valid username and password
    And path "/secure/webapi/all"
    And headers {Accept: "application/json", Authorization :"Basic YWRtaW46d2VsY29tZQ=="}
    When method get
    Then status 200
    And match response == "#notnull"

    @Secure_TC_02
  Scenario:Check the positive flow of fetching data by providing valid username and invalid password
    And path "/secure/webapi/all"
    And headers {Accept: "application/json", Authorization :"Basic YWRtaW46ZGN2ZGN3"}
    When method get
    Then status 401
    And match response == "#notnull"

