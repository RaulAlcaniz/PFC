Feature: Editing Varieties
  In order to alter a variety information
  As a user
  I want a form to edit the variety when I'm an admin

  Background:
    Given there are the following users:
      | email              | password | admin  |
      | admin@testing.com  | password | true   |
      | user@testing.com   | password | false  |
    And I am signed in as "admin@testing.com"

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

    Given I am on the variety page for "Black with rust red markings"
    When I follow "Edit Variety"

  @done
  Scenario: Updating a variety
    When I fill in "Name" with "beta"
    And I press "Update Variety"

    Then I should see "Variety has been updated."
    And I should be on the variety page for "beta"
    And I should see "beta" within "#varieties"
    But I should not see "Dobermann" within "#varieties"

  @done
  Scenario: Updating a variety without a name is bad
    When I fill in "Name" with ""
    And I press "Update Variety"
    Then I should see "Variety has not been updated."
    And I should see "Name can't be blank"