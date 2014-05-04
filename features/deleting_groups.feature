Feature: Deleting groups
  In order to remove any group
  As user
  I want to make it disappear

  Background:
    Given there is a group called "Group I"
    And I am on the groups page
    When I follow "Group I"

  Scenario: Deleting groups
    When I follow "Delete group"
    Then I should see "Group has been deleted."
    And I should not see "Group I"