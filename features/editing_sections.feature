Feature: Editing Section
  In order to alter a section information
  As a user
  I want a form to edit the sections when I'm an admin

  Background:
    Given there are the following users:
      | email              | password | admin  |
      | admin@testing.com  | password | true   |
      | user@testing.com   | password | false  |
    And I am signed in as "admin@testing.com"

    Given there is a group called "Group I"
    And there are sections for this group:
      |Section number|Description|
      |Section 1     |Sheepdogs  |
      |Section 2     |Cattle Dogs|

    Given I am on the groups page
    When I follow "Group I"
    And I follow "Sheepdogs"
    And I follow "Edit Section"

  @done
  Scenario: Updating a section as admin
    When I fill in "Name" with "beta"
    And I fill in "Description" with "Description beta"
    And I press "Update Section"
    Then I should see "Section has been updated."
    And I should be on the section page for "beta"
    And I should see "beta" within "#sections h2"
    But I should not see "1"

  @done
  Scenario: Updating a section as admin with a description already taken is bad
    When I fill in "Description" with "Cattle Dogs"
    And I press "Update Section"
    Then I should see "Section has not been updated."
    And I should see "Description has already been taken"

  @done
  Scenario: Updating a section as admin without a name is bad
    When I fill in "Name" with ""
    And I press "Update Section"
    Then I should see "Section has not been updated."
    And I should see "Name can't be blank"

  @done
  Scenario: Updating a section as admin without a description is bad
    When I fill in "Description" with ""
    And I press "Update Section"
    Then I should see "Section has not been updated."
    And I should see "Description can't be blank"