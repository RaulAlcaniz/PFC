Feature: Editing Groups
  In order to update a group information
  As a user
  I want to be able to do that through an interface when I'm an admin

  Background:
    Given there are the following users:
      | email              | password | admin  |
      | admin@testing.com  | password | true   |
      | user@testing.com   | password | false  |
    And I am signed in as "admin@testing.com"

    Given there is a group called "Group I"
    And I am on the groups page

    When I follow "Group I"
    And I follow "Edit group"

  @done
  Scenario: Updating a group as admin
    When I fill in "Name" with "Group I beta"
    And I fill in "Description" with "Description beta"
    And I press "Update Group"
    Then I should see "Group has been updated."
    And I should be on the group page for "Group I beta"

  @done
  Scenario: Updating a group with a name already taken is bad
    Given there is a group called "Group II"
    When I fill in "Name" with "Group II"
    And I fill in "Description" with "Sheepdogs and Cattle Dogs (except Swiss Cattle Dog)"
    And I press "Update Group"
    Then I should see "Group has not been updated."
    And I should see "Name has already been taken"

  @done
  Scenario: Updating a group with a description already taken is bad
    Given there is a group which description is "Terriers"
    When I fill in "Description" with "Terriers"
    And I press "Update Group"
    Then I should see "Group has not been updated."
    And I should see "Description has already been taken"

  @done
  Scenario: Updating a group with invalid name is bad
    When I fill in "Name" with ""
    And I press "Update Group"
    Then I should see "Group has not been updated."
    And I should see "Name can't be blank"

  @done
  Scenario: Updating a group with invalid description is bad
    When I fill in "Description" with ""
    And I press "Update Group"
    Then I should see "Group has not been updated."
    And I should see "Description can't be blank"