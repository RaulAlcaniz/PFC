Feature: Deleting people
  In order to remove people
  As user
  I want to make it disappear when I'm an admin

  Background:
    Given there are the following users:
      | email              | password | admin  |
      | admin@testing.com  | password | true   |
      | user@testing.com   | password | false  |

    Given I am signed in as "user@testing.com"

    #Given there is a person called "Dorothy Oz"
    And I am on the profile for "user@testing.com"

  @done
  Scenario: Deleting people
    When I follow "Delete person"
    Then I should see "Person has been deleted."
    And I should be on the home page