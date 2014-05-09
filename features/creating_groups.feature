Feature: Creating groups
  In order to have groups to assign sections to
  As a user
  I want to create them easily

  Background:
    Given I am on the groups page
    And I follow "New Group"

  @done
  Scenario: Creating a group
    When I fill in "Name" with "Group I"
    And I fill in "Description" with "Sheepdogs and Cattle Dogs (except Swiss Cattle Dog)"
    And I press "Create Group"
    Then I should see "Group has been created."
    And I should be on the group page for "Group I"

  @done
  Scenario: Creating an existing group
    Given there is a group called "Group I"
    When I fill in "Name" with "Group I"
    And I fill in "Description" with "Sheepdogs and Cattle Dogs (except Swiss Cattle Dog)"
    And I press "Create Group"
    Then I should see "Group has not been created."
    And I should see "Name has already been taken"

  @done
  Scenario: Creating a group without a name
    When I fill in "Name" with ""
    And I press "Create Group"
    Then I should see "Group has not been created."
    And I should see "Name can't be blank"

  @done
  Scenario: Creating a group without a description
    When I fill in "Description" with ""
    And I press "Create Group"
    Then I should see "Group has not been created."
    And I should see "Description can't be blank"