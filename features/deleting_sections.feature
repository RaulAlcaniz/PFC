Feature: Deleting Sections
  In order to remove sections
  As a user
  I want to press a button and make it disappear when I'm an admin

  Background:
    Given there are the following users:
      | email              | password | admin  |
      | admin@testing.com  | password | true   |
      | user@testing.com   | password | false  |
    Given I am signed in as "admin@testing.com"

  @done
  Scenario: Deleting a section with breeds as admin
    Given there is a group called "Group I"
    And there are sections for this group:
      |Section number|Description|
      |Section 2     |Cattledogs |
    And there are some breeds for the section number "Section 2":
      |Name                 |
      |Australian Cattle Dog|

    Given I am on the section page for "Section 2"
    And I follow "Delete Section"

    Then I should see "Section has been deleted."
    And I should be on the group page for "Group I"
    And I should not see "Cattledogs"
    And all "breeds" for this section should have been removed

  @done
  Scenario: Deleting a section with subsections as admin
    Given there is a group called "Group II"
    And there are sections for this group:
      |Section number|Description                |
      |Section 1     |Pinscher and Schnauzer type|
    Given there are subsections for the section with section number "Section 1":
      |Subsection number|Description|
      |Subsection 3     |Smoushond  |

    Given I am on the section page for "Section 1"
    And I follow "Delete Section"

    Then I should see "Section has been deleted."
    And I should be on the group page for "Group II"
    And I should not see "Pinscher and Schnauzer type"
    And all "subsections" for this section should have been removed
