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
