Feature: create_wl_install_app_steps
  I want to login to appstack home page

  Scenario: Login for zhongnan
    Given I have entered "zhongnan@appcara.com" as username
    And I continue entered "password" as password
    When I press login
    Then the result should show "Dashboard" now
#Background:
#Given I have login to appstack

  Scenario: Create an empty workload
    Given I have entered "CapybaraTest1" as workload name
    And I continue entered "Test with capybara plus cucumber" as Description
    And I choose the "staging" as Life Cycle
    And I choose the "cloudstack-he" as Cloud Profile
    When I press Next step
    And I choose "No, thanks" as Which package suits you?
    And I continue press Next step
    Then Summary page shows "Use Template"
    And Summary page also shows "Hourly Cost"
    When I press Create Workloads
    Then the create workload result should show "CapybaraTest1"

  Scenario: Add an app to a new server
    Given I click New Application
    And I scroll down to the "Tomcat" section
    When I click subscribe
    Then the subscribe result should show "Install Tomcat"
    When I click Deploy
    Then the event log should show "Create Server"
    And after a while the event log should show "Bootstrapping Server"
    And finally the event log should show "Deploy Server"