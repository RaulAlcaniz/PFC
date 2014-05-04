Feature: Creating sections
  In order to create sections for groups
  As a user
  I want to be able to select a group and do it

  Background:
    Given there is a group called "Group I"
    And I am on the groups page
    When I follow "Group I"
    And I follow "Add section"

  Scenario: Creating a section
    When I fill in "Section number" with "1"
    And I fill in "Description" with "Sheepdogs"
    And I press "Create section"
    Then I should see "Section has been created"

  Scenario: Creating a section without attributes
    When I press "Create section"
    Then I should see "Section has not been created."
    And I should see "Section number can't be blank"
    And I should see "Description can't be blank"