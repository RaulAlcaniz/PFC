Feature: Deleting Subsections
  In order to remove subsections
  As a user
  I want to press a button and make it disappear

  Background:
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

    And I am on the section page for "Section 1"
    And I follow "Pinscher"

  @done
  Scenario: Deleting a subsection
    When I follow "Delete Subsection"
    Then I should see "Subsection has been deleted."
    And I should be on the section page for "Section 1"
    And I should not see "Smoushond"
    And all "breeds" for this subsection should have been removed