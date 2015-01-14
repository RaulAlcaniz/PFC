Feature: Deleting groups
  In order to remove groups
  As user
  I want to make it disappear when I'm an admin

  Background:
    Given there are the following users:
      | email              | password | admin  |
      | admin@testing.com  | password | true   |
      | user@testing.com   | password | false  |
    And I am signed in as "admin@testing.com"

    Given there is a group called "Group I"
    And there are sections for this group:
      | Section number | Description |
      | Section 1      | Sheepdogs   |
      | Section 2      | Cattledogs  |
    And I am on the groups page

    When I follow "Group I"
    And I follow "Delete group"

  @done
  Scenario: Deleting groups as admin
    Then I should see "Group has been deleted."
    And I should not see "Group I"
    And all sections for this group should have been removed


