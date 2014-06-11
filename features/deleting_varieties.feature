Feature: Deleting Varieties
  In order to remove varieties
  As a user
  I want to press a button and make it disappear

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

    Given I am on the variety page for "Black with rust red markings"

  @done
  Scenario: Deleting a variety
    When I follow "Delete Variety"
    Then I should see "Variety has been deleted."
    And I should be on the breed page for "Dobermann"
    And I should not see "Black with rust red markings"