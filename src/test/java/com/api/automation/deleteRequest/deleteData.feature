Feature: Delete the obsolete data which is not required 

  Background: Do the basic set up
    Given url "http://localhost:9191"
    * def randomInteger = function(){return Math.floor((100)* Math.random());}
    * def ints = randomInteger()
    * def title = "Mechanical Engineer"
    * def jobDes = "Chemical Engineering"

    @TC_01
  Scenario: Delete the data by passing static Id value to the path 
    And path "/normal/webapi/remove/27"
    And header Accept = "application/json"
    When method delete
    Then status 404
    And match response.message == "Entry with id = 27 not found"

    @TC_02
  Scenario: Create a data using POST , then update it using PATCH and then delete it using DELETE
    * def createJob = call read("../helperFeatureFileWithVariables.feature") {_url : "http://localhost:9191", _path: "/normal/webapi/add", _id: "#(ints)"}
    #--------------patch request------------
    And path '/normal/webapi/update/details'
    And params {id : "#(ints)", jobTitle : "#(title)",jobDescription : "I am a mechanical engineer"}
    And header Accept = "application/json"
    And request {}
    When method patch
    Then status 200

    #-------Delete request------
    And path "/normal/webapi/remove/"+ints
    And header Accept = "application/json"
    When method delete
    Then status 200
    # And match response.message == "Entry with id = 27 not found"

    #------GET Request-----------
    And path "normal/webapi/find"
    And params {id:"#(ints)", jobTitle : "#(title)"}
    And header Accept = "application/json"
    When method get
    Then status 404
    And match response.message == "Failed to find job with id="+ints+", jobTitle="+title+""
    And print response

    @TC_03
  Scenario: Demo the Chaining request
    # 1. Create a job new entry
    # 2. Extract the job ID and Job title from the response of the POST request
    # 3. Send the patch request, Value of query parameter will be set by, info extracted from previous request
    # 4. Extract the jobId and jobTitle from the repsonse of the ptach request
    # 5. Get request with query parameter, value of query param is set by info extracted from response of patch request
    # 6. Add the validation on Job description in the response of get request
    * def createJob = call read("../helperFeatureFileWithVariables.feature") {_url : "http://localhost:9191", _path: "/normal/webapi/add", _id: "#(ints)"}
    * def postJobId = createJob.response.jobId
    * def postJobTitle = createJob.response.jobTitle
    And print "postJobId ----->", postJobId
    And print "postJobTitle ----->", postJobTitle

     #--------------patch request------------
    And path '/normal/webapi/update/details'
    And params {id : "#(postJobId)", jobTitle : "#(postJobTitle)",jobDescription : "#(jobDes)"}
    And header Accept = "application/json"
    And request {}
    When method patch
    Then status 200
    And match response.jobTitle == postJobTitle
    * def patchJobID = response.jobId
    * def patchJobTitle = response.jobTitle
    And print "patchJobID ----->", patchJobID
    And print "patchJobTitle ----->", patchJobTitle

    #-------------Get request with query parameter------------
    And path "normal/webapi/find"
    And params {id:"#(patchJobID)", jobTitle : "#(patchJobTitle)"}
    And header Accept = "application/json"
    When method get
    Then status 200
    And match response.jobDescription == jobDes

