Feature:These is Utils file where code can be used multiples time from any package

  Scenario:Create an entry using POST method and then Update any data in a JSON by using PUT method
    * def randomInteger = function(){return Math.floor((100)* Math.random());}
    * def ints = randomInteger()
    Given url "http://localhost:9191"
    When path "/normal/webapi/add"
    When request {"jobId":"#(ints)","jobTitle":"Chemical Engineering","jobDescription":"To test chemical content","experience":["Google","Apple","Mobile Iron","Appium"],"project":[{"projectName":"E-Commerce App","technology":["Kotlin","SQL Lite","Gradle","C++"]}]}
    And headers {Accept: "application/json", Content-Type: "application/json"}
    When method post
    And status 201
    * def dataJobId = response.jobId
  