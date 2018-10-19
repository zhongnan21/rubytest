# features/createWorkload.feature
Feature: CreateWorkload
  I want to create a new workload after login to appcara system. The way to create a new workload is click
  the 'Workloads' link and click the 'Add Workload' link.
#  Background:
#    Given I visit the expedia home page
  Scenario: Create an empty workload
    Given I have entered "CapybaraTest1" as workload name
    And I continue entered "Test with capybara plus cucumber" as Description
    And I choose the "dev" as Life Cycle
    And I choose the "cloudstack-he" as Cloud Profile
    When I press Next step
    And I choose "No, thanks" as Which package suits you?
    And I continue press Next step
    Then Summary page shows "CapybaraTest1"
    And Summary page also shows "USD $0"
    When I press Create Workloads
    Then the result should show "Succeeded to create workload [CapybaraTest1]"
