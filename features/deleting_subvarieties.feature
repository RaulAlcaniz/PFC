Feature: Deleting Subvarieties
  In order to remove subvarieties
  As a user
  I want to press a button and make it disappear when I'm an admin

  Background:
    Given there are the following users:
      | email              | password | admin  |
      | admin@testing.com  | password | true   |
      | user@testing.com   | password | false  |

    Given there is a group called "Group IV"
    And there are sections for this group:
      |Section number|Description|
      |Section 1     |Dachshunds |
    And there are some breeds for the section number "Section 1":
      |Name     |
      |Dachshund|
    And there are varieties for the breed "Dachshund":
      |Name     |
      |Standard |
      |Miniature|
    And there are subvarities for the variety "Standard":
      |Name         |
      |Smooth-haired|
      |Long-haired  |
      |Wire-haired  |

  @done
  Scenario: Deleting a subvariety
    Given I am signed in as "admin@testing.com"
    And I am on the subvariety page for "Smooth-haired"

    When I follow "Delete Subvariety"
    Then I should see "Subvariety has been deleted."
    And I should be on the variety page for "Standard"
    And I should not see "Smooth-haired"

  @done
  Scenario: Deleting subvarieties as no admin is bad
    Given I am signed in as "user@testing.com"
    And I am on the subvariety page for "Smooth-haired"

    And I try to delete the "subvariety" "Smooth-haired"

    Then I should be redirected to the home page
    And I should see "You can't access to this page."