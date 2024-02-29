Feature:These is Utils file where code can be used multiples time from any package with Variables

  Scenario:Create an entry with JSON Data
    Given url _url
    When path _path
    And print "ur value-------->" ,_url
    And print "path value-------->" ,_path
    And print "id value-------->" ,_id

    And request {"jobId":"#(_id)","jobTitle":"Chemical Engineering","jobDescription":"To test chemical content","experience":["Google","Apple","Mobile Iron","Appium"],"project":[{"projectName":"E-Commerce App","technology":["Kotlin","SQL Lite","Gradle","C++"]}]}
    And headers {Accept: "application/json", Content-Type: "application/json"}
    When method post
    And status 201
    * def dataJobId = response.jobId
    And print "id------------------>",dataJobId

