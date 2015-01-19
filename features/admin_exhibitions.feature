@time_travel
Feature: Admin exhibitions
  In order to manage exhibitions
  As a admin
  I want to be able to manage exhibitions when I'm admin

  Background:
    Given today is "10-12-2013"
    Given there are the following users:
      | email              | password | admin  |
      | admin@testing.com  | password | true   |
      | user@testing.com   | password | false  |
      | boy@testing.com    | password | false  |

    Given I am signed in as "admin@testing.com"

    Given the exhibition "TWK 139th Dog Show" exists

  @done
  Scenario: Update exhibitions when payment deadlines began is bad
    Given payment deadlines began for "TWK 139th Dog Show"
    Given I am on the exhibition page for "TWK 139th Dog Show"
    And I follow "Edit Exhibition"

    Then I should be on the exhibition page for "TWK 139th Dog Show"
    And I should see "Exhibition can't be updated or deleted because payment deadlines began."

  @done
  Scenario: Delete exhibitions when payment deadlines began is bad
    Given payment deadlines began for "TWK 139th Dog Show"
    Given I am on the exhibition page for "TWK 139th Dog Show"
    And I follow "Delete Exhibition"

    Then I should be on the exhibition page for "TWK 139th Dog Show"
    And I should see "Exhibition can't be updated or deleted because payment deadlines began."

  @done
  Scenario: Trying to access to the admin page for the users exhibitions as not admin is bad
    Given I follow "Sign out"
    And I am signed in as "user@testing.com"
    When I try to access the admin page for exhibitions of "boy@testing.com"

    Then I should be redirected to the home page
    And I should see "You can't access to this page."
