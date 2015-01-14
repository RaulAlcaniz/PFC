Feature: Deleting Subvarieties
  In order to remove subvarieties
  As a user
  I want to press a button and make it disappear when I'm an admin

  Background:
    Given there are the following users:
      | email              | password | admin  |
      | admin@testing.com  | password | true   |
      | user@testing.com   | password | false  |

    Given I am signed in as "admin@testing.com"

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

    Given I am on the subvariety page for "Smooth-haired"

  @done
  Scenario: Deleting a subvariety
    When I follow "Delete Subvariety"
    Then I should see "Subvariety has been deleted."
    And I should be on the variety page for "Standard"
    And I should not see "Smooth-haired"