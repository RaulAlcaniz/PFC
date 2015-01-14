Feature: Security for subvarieties
  In order to protect subvarieties information
  As a no admin user
  I should not be able to change subvarieties information

  Background:
    Given there are the following users:
      | email              | password | admin  |
      | admin@testing.com  | password | true   |
      | user@testing.com   | password | false  |
    And I am signed in as "user@testing.com"

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

    Given I am on the variety page for "Standard"

  @done
  Scenario: Creating a subvariety when the user is not an admin is bad
    When I follow "New Subvariety"

    Then I should be redirected to the home page
    And I should see "You can't access to this page."

  @done
  Scenario: Deleting a subvariety when the user is not an admin is bad
    Given I am on the subvariety page for "Smooth-haired"
    When I follow "Delete Subvariety"

    Then I should be redirected to the home page
    And I should see "You can't access to this page."

  @done
  Scenario: Updating a subvariety when the user is not an admin is bad
    Given I am on the subvariety page for "Smooth-haired"
    When I follow "Edit Subvariety"

    Then I should be redirected to the home page
    And I should see "You can't access to this page."