Feature: to execute Java Script function

    @Script
  Scenario: Execute JavaScript Function with and without Parameters
    * def c = function(a,b){return a + b;}
    Then print c(3,5)
