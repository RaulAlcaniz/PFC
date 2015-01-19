Feature: Deleting exhibitions
  In order to remove exhibitions
  As user
  I want to make it disappear when I'm an admin

  Background:
    Given there are the following users:
    | email              | password | admin  |
    | admin@testing.com  | password | true   |
    | user@testing.com   | password | false  |

    And there is an exhibition called "9th Annual Dog Show"

  @done
  Scenario: Deleting exhibitions
    Given I am signed in as "admin@testing.com"
    And I am on the exhibition page for "9th Annual Dog Show"

    When I follow "Delete Exhibition"
    Then I should be on the exhibitions page
    And I should see "Exhibition has been deleted."
    And I should not see "9th Annual Dog Show"

  @done
  Scenario: Deleting exhibitions as no admin is bad
    Given I am signed in as "user@testing.com"
    And I am on the exhibition page for "9th Annual Dog Show"

    When I try to delete the "exhibition" "9th Annual Dog Show"

    Then I should be redirected to the home page
    And I should see "You can't access to this page."