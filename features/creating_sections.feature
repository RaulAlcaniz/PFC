Feature: Creating sections
  In order to create sections for groups
  As a user
  I want to be able to follow a group and do it

  Background:
    Given there is a group called "Group I"
    And I am on the groups page
    When I follow "Group I"
    And I follow "New Section"

  @done
  Scenario: Creating a section
    When I fill in "Name" with "1"
    And I fill in "Description" with "Sheepdogs"
    And I press "Create Section"
    Then I should see "Section has been created."
    And I should be on the section page for "1"

 # @revisar
 # Scenario: Creating an existing section
 #   Given there is a section which description is "Sheepdogs"
 #   When I fill in "Name" with "1"
 #  And I fill in "Description" with "Sheepdogs"
 #   And I press "Create Section"
 #   Then I should see "Section has not been created."
 #   And I should see "Description has already been taken"

  @done
  Scenario: Creating a section without a name
    When I fill in "Name" with ""
    And I press "Create Section"
    Then I should see "Section has not been created."
    And I should see "Name can't be blank"

  @done
  Scenario: Creating a section without a description
    When I fill in "Description" with ""
    And I press "Create Section"
    Then I should see "Section has not been created."
    And I should see "Description can't be blank"