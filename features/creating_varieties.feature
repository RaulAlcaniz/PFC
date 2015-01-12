Feature: Creating varieties
  In order to create varieties for some breed
  As a user
  I want to create them easily

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

    Given I am on the breed page for "Dobermann"
    When I follow "New Variety"

  @done
  Scenario: Creating a variety
    When I fill in "Name" with "Black with rust red markings"
    And I press "Create Variety"
    Then I should see "Variety has been created."
    And I should be on the variety page for "Black with rust red markings"

  @done
  Scenario: Creating a variety without a name is bad
    When I fill in "Name" with ""
    And I press "Create Variety"
    Then I should see "Variety has not been created."
    And I should see "Name can't be blank"