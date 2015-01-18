@time_travel
Feature: Admin people
  In order to manage people
  As a admin
  I want to be able to manage people when I'm admin

  Background:
    Given there are the following users:
      | email              | password | admin  |
      | admin@testing.com  | password | true   |
      | user@testing.com   | password | false  |

    Given I am signed in as "admin@testing.com"

  @done
  Scenario: Viewing people being admin
    When I follow "People page"
    And I follow "user@testing.com"

    Then I should be on the person page for "user@testing.com"
    And I should see "Add a dog"
    And I should see "View dogs"
    And I should see "View enrolments"
    And I should see "View payments"
    And I should see "Edit person"
    And I should see "Delete person"

    Given I am on the people page
    When I follow "admin@testing.com"
    And I should see "Admin"
    And I should see "Edit person"
    And I should see "Delete person"

  @done
  Scenario: deleting people being admin
    Given I am on the person page for "user@testing.com"
    When I follow "Delete person"

    Then I should be on the people page
    And I should not see "user@testing.com"

  @done
  Scenario: Trying to delete myself as admin is bad
    Given I am on the person page for "admin@testing.com"
    When I follow "Delete person"

    Then I should be on the person page for "admin@testing.com"
    And I should see "You can't delete yourself as admin"

  @done
  Scenario: Administering people's dogs being admin
    Then I should be able to add a new dog for "user@testing.com"
    And I should be on the dog page for "Snoopy"

    And I should be able to "view" the "dog" "Snoopy"

    Given I should be able to "edit" the "dog" "Snoopy"
    Then I should see "Dog has been updated"

    Given I should be able to "delete" the "dog" "Snoopy"
    Then I should be on the dogs page for "user@testing.com"
    And I should not see "Snoopy"



