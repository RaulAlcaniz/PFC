Feature: Viewing subsections
  In order to view the subsections for a section
  As a user
  I want to see them on that section's page

  Background:
    Given there is a group called "Group II"
    And there are sections for this group:
      |Section number|Description                |
      |Section 1     |Pinscher and Schnauzer type|
      |Section 2     |Molossoid breeds           |
    And there are subsections for the section with section number "Section 1":
      |Subsection number|Description|
      |Subsection 1     |Pinscher   |
      |Subsection 2     |Schnauzer  |

    Given I am on the section page for "Section 1"

  @done
  Scenario: Viewing subsections for a section
    Then I should see "Pinscher"
    And I should see "Schnauzer"
    When I follow "Pinscher"
    Then I should see "Subsection 1" within "#subsections h2"
    And I should see "Pinscher"
    And I should not see "Subsection 2"