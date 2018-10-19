# features/login.feature
Feature: Login
  I want to login to appstack home page
  Scenario: Login for zhongnan
    Given I have entered "uat.user.1@appcara.com" as username for test
    And I continue entered "changeme" as password for test
    When I press login for test
#    Then the result should show "Dashboard"
    Then Main page shows "Forgot password"
    Given I have entered "uat.user.1@appcara.com" as username again
    And I continue entered "changeme" as password again
    When I press login again
    Then the result should show "Dashboard" now for test
