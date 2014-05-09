Feature: Editing Section
  In order to alter section information
  As a user
  I want a form to edit the sections

  Background:
    Given there is a group called "Group I"
    And there are sections for this group:
      |SECTION ID|GROUP ID|Section number|Description|
      |1         |1       |1             |Sheepdogs  |
    And I am on the groups page
    When I follow "Group I"
    And I follow "Sheepdogs"
    And I follow "Edit Section"

  @done
  Scenario: Updating a section
    When I fill in "Name" with "beta"
    And I fill in "Description" with "Description beta"
    And I press "Update Section"
    Then I should see "Section has been updated."
    And I should be on the section page for "beta"
    And I should see "beta" within "#sections h2"
    But I should not see "1"

  @actual
  Scenario: Updating a section without a name
    When I fill in "Name" with ""
    And I press "Update Section"
    Then I should see "Section has not been updated."
    And I should see "Name can't be blank"

  @pending
  Scenario: Updating a section without a description
    When I fill in "Description" with ""
    And I press "Update Section"
    Then I should see "Section has not been updated."
    And I should see "Description can't be blank"

  @pending
  Scenario: Updating a section which name already exist



