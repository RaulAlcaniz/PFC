Feature: Deleting Breeds
  In order to remove breeds
  As a user
  I want to press a button and make it disappear

  Background:
    Given there is a group called "Group II"
    And there are sections for this group:
      |Section number|Description                |
      |Section 1     |Pinscher and Schnauzer type|
    And there are subsections for the section with section number "Section 1":
      |Subsection number|Description|
      |Subsection 1.1   |Pinscher   |
      |Subsection 1.2   |Schnauzer  |
    And there are some breeds for the subsection with subsection number "Subsection 1.1":
      |Name                     |
      |Dobermann                |

    Given there is a group called "Group III"
    And there are sections for this group:
      |Section number|Description         |
      |Section 2     |Small-sized Terriers|
    And there are some breeds for the section number "Section 2":
      |Name                |
      |Australian Terrier  |

  @done
  Scenario: Deleting a breed for a section
    Given I am on the section page for "Section 2"
    And I follow "Australian Terrier"
    And I follow "Delete Breed"

    Then I should see "Breed has been deleted."
    And I should be on the section page for "Section 2"
    And I should not see "Australian Terrier"

  @done
  Scenario: Deleting a breed for a subsection
    Given I am on the subsection page for "Subsection 1.1"
    And I follow "Dobermann"
    And I follow "Delete Breed"

    Then I should see "Breed has been deleted."
    And I should be on the subsection page for "Subsection 1.1"
    And I should not see "Dobermann"