Feature: Editing Subsections
  In order to alter a subsection information
  As a user
  I want a form to edit the subsection

  Background:
    Given there is a group called "Group II"
    And there are sections for this group:
      |Section number|Description                |
      |1             |Pinscher and Schnauzer type|
    And there are subsections for the section with section number "1":
      |Subsection number|Description|
      |3                |Smoushond  |

    And I am on the section page for "1"
    When I follow "Smoushond"
    And I follow "Edit Subsection"

  @done
  Scenario: Updating a subsection
    When I fill in "Name" with "beta"
    And I fill in "Description" with "Description beta"
    And I press "Update Subsection"
    Then I should see "Subsection has been updated."
    And I should be on the subsection page for "beta"
    And I should see "beta" within "#subsections"
    But I should not see "3" within "#subsections"

  @done
  Scenario: Creating an existing subsection
    Given there is a subsection which description is "Pinscher"

    When I fill in "Description" with "Pinscher"
    And I press "Update Subsection"
    Then I should see "Subsection has not been updated."
    And I should see "Description has already been taken"

  @done
  Scenario: Updating a subsection without a name
    When I fill in "Name" with ""
    And I press "Update Subsection"
    Then I should see "Subsection has not been updated."
    And I should see "Name can't be blank"

  @done
  Scenario: Updating a subsection without a description
    When I fill in "Description" with ""
    And I press "Update Subsection"
    Then I should see "Subsection has not been updated."
    And I should see "Description can't be blank"