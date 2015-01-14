Feature: Creating groups
  In order to have groups to assign sections to
  As a user
  I want to create them easily when I'm an admin

  Background:
    Given there are the following users:
      | email              | password | admin  |
      | admin@testing.com  | password | true   |
      | user@testing.com   | password | false  |

    Given I am signed in as "admin@testing.com"
    Given I am on the groups page
    And I follow "New Group"

  @done
  Scenario: Creating a group as admin
    When I fill in "Name" with "Group I"
    And I fill in "Description" with "Sheepdogs and Cattle Dogs (except Swiss Cattle Dog)"
    And I press "Create Group"
    Then I should see "Group has been created."
    And I should be on the group page for "Group I"

  @done
  Scenario: Creating an existing group is bad
    Given there is a group called "Group I"
    When I fill in "Name" with "Group I"
    And I fill in "Description" with "Sheepdogs and Cattle Dogs (except Swiss Cattle Dog)"
    And I press "Create Group"
    Then I should see "Group has not been created."
    And I should see "Name has already been taken"

  @done
  Scenario: Creating a group with a description already taken is bad
    Given there is a group which description is "Terriers"
    When I fill in "Name" with "Group I"
    And I fill in "Description" with "Terriers"
    And I press "Create Group"
    Then I should see "Group has not been created."
    And I should see "Description has already been taken"

  @done
  Scenario: Creating a group without a name is bad
    When I fill in "Name" with ""
    And I press "Create Group"
    Then I should see "Group has not been created."
    And I should see "Name can't be blank"

  @done
  Scenario: Creating a group without a description is bad
    When I fill in "Description" with ""
    And I press "Create Group"
    Then I should see "Group has not been created."
    And I should see "Description can't be blank"