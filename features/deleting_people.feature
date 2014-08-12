Feature: Deleting people
  In order to remove people
  As user
  I want to make it disappear

  Background:
    Given there is a person called "Personal Name"
    And I am on the person page for "Personal Name"

  @done
  Scenario: Deleting people
    When I follow "Delete person"
    Then I should see "Person has been deleted."
    And I should be on the people page
    And I should not see "Personal Name"