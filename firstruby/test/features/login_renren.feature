# features/login_renren.feature
Feature: Login
  I want to check renren status update
  Scenario: Login for zhongnan
    Given I have entered "zhongnan" as username
    And I continue entered "password" as password
    When I press login
    Then the result should show "My page"