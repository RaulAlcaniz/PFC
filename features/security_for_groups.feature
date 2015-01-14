Feature: Security for groups
  In order to protect groups information
  As a no admin user
  I should not be able to change groups information

  Background:
    Given there are the following users:
      | email              | password | admin  |
      | admin@testing.com  | password | true   |
      | user@testing.com   | password | false  |
    And I am signed in as "user@testing.com"

    Given there is a group called "Group I"
    And I am on the groups page

  @done
  Scenario: Creating a group when the user is not an admin is bad
    When I follow "New Group"

    Then I should be redirected to the home page
    And I should see "You can't access to this page."

  @done
  Scenario: Deleting groups when the user is not an admin is bad
    When I follow "Group I"
    And I follow "Delete group"

    Then I should be redirected to the home page
    And I should see "You can't access to this page."

  @done
  Scenario: Updating a group when the user is not an admin is bad
    When I follow "Group I"
    When I follow "Edit group"

    Then I should be redirected to the home page
    And I should see "You can't access to this page."