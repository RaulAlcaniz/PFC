Feature: Deleting Subsections
  In order to remove subsections
  As a user
  I want to press a button and make it disappear when I'm an admin

  Background:
    Given there are the following users:
      | email              | password | admin  |
      | admin@testing.com  | password | true   |
      | user@testing.com   | password | false  |

    Given there is a group called "Group II"
    And there are sections for this group:
      |Section number|Description                |
      |Section 1     |Pinscher and Schnauzer type|
    And there are subsections for the section with section number "Section 1":
      |Subsection number|Description|
      |Subsection 1     |Pinscher  |
    And there are some breeds for the subsection with subsection number "Subsection 1":
      |Name         |
      |Dobermann    |
      |Affenpinscher|

  @done
  Scenario: Deleting a subsection
    Given I am signed in as "admin@testing.com"
    And I am on the section page for "Section 1"
    When I follow "Pinscher"
    And I follow "Delete Subsection"

    Then I should see "Subsection has been deleted."
    And I should be on the section page for "Section 1"
    And I should not see "Smoushond"
    And all "breeds" for this subsection should have been removed

  @done
  Scenario: Deleting subsections as no admin is bad
    Given I am signed in as "user@testing.com"
    And I am on the section page for "Section 1"

    When I follow "Pinscher"
    And I try to delete the "subsection" "Subsection 1"

    Then I should be redirected to the home page
    And I should see "You can't access to this page."