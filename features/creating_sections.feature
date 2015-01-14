Feature: Creating sections
  In order to create sections for groups
  As a user
  I want to be able to follow a group and do it when I'm an admin

  Background:
    Given there are the following users:
      | email              | password | admin  |
      | admin@testing.com  | password | true   |
      | user@testing.com   | password | false  |
    And I am signed in as "admin@testing.com"

    Given there is a group called "Group I"
    And I am on the groups page

    When I follow "Group I"
    And I follow "New Section"

  @done
  Scenario: Creating a section as admin
    When I fill in "Name" with "1"
    And I fill in "Description" with "Sheepdogs"
    And I press "Create Section"
    Then I should see "Section has been created."
    And I should be on the section page for "1"

  @done
  Scenario: Creating an existing section is bad
    Given there is a section which description is "Sheepdogs"
    When I fill in "Description" with "Sheepdogs"
    And I press "Create Section"
    Then I should see "Section has not been created."
    And I should see "Description has already been taken"

  @done
  Scenario: Creating a section without a name is bad
    When I fill in "Name" with ""
    And I press "Create Section"
    Then I should see "Section has not been created."
    And I should see "Name can't be blank"

  @done
  Scenario: Creating a section without a description is bad
    When I fill in "Description" with ""
    And I press "Create Section"
    Then I should see "Section has not been created."
    And I should see "Description can't be blank"