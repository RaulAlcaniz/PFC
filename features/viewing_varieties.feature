Feature: Viewing varieties
  In order to view the varieties for a breed
  As a user
  I want to see them on that breed page

  Background:
    Given there is a group called "Group II"
    And there are sections for this group:
      |Section number|Description                |
      |Section 1     |Pinscher and Schnauzer type|
      |Section 2     |Molossoid breeds           |
    And there are subsections for the section with section number "Section 1":
      |Subsection number|Description|
      |Subsection 1.1   |Pinscher   |
      |Subsection 1.2   |Schnauzer  |
    And there are some breeds for the subsection with subsection number "Subsection 1.1":
      |Name                     |
      |Dobermann                |
      |Österreichischer Pinscher|
    And there are varieties for the breed "Dobermann":
      |Name                        |
      |Black with rust red markings|
      |Brown with rust red markings|

    Given I am on the subsection page for "Subsection 1.1"
    And I follow "Dobermann"

  @done
  Scenario: Viewing varieties for a breed
    Then I should see "Black with rust red markings"
    And I should see "Brown with rust red markings"

    When I follow "Black with rust red markings"
    Then I should see "Black with rust red markings" within "#varieties h2"