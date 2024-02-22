Feature: to execute Java Script function

@Script
Scenario: Execute JavaScript Function with and without Parameters
    * def a = 10
    * def b = 20
    * def c = function {return a + b}
    Then print c
