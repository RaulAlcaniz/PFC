Feature: Deleting people
  In order to remove people
  As user
  I want to make it disappear when I'm an admin

  Background:
    Given there are the following users:
      | email              | password | admin  |
      | admin@testing.com  | password | true   |
      | user@testing.com   | password | false  |

    Given there is a person called "Dorothy Oz"

  @done
  Scenario: Deleting users
    Given I am signed in as "user@testing.com"
    And I am on my profile page
    When I follow "Cancel account"
    Then I should see "Account has been deleted."
    And I should be on the home page

  @done
  Scenario: Deleting people
    Given I am signed in as "admin@testing.com"
    Given I am on the person page for "Dorothy Oz"
    When I follow "Cancel account"
    Then I should see "Person has been deleted."
    And I should be on the people page