Feature: Creating subsections
  In order to create subsections for sections
  As a user
  I want to be able to follow a section and do it when I'm an admin

  Background:
    Given there are the following users:
      | email              | password | admin  |
      | admin@testing.com  | password | true   |
      | user@testing.com   | password | false  |

    Given I am signed in as "admin@testing.com"

    Given there is a group called "Group II"
    And there are sections for this group:
      |Section number|Description                |
      |Section 1     |Pinscher and Schnauzer type|
    And I am on the section page for "Section 1"
    When I follow "New Subsection"

  @done
  Scenario: Creating a subsection
    When I fill in "Name" with "Subsection 1"
    And I fill in "Description" with "Pinscher"
    And I press "Create Subsection"
    Then I should see "Subsection has been created."
    And I should be on the subsection page for "Subsection 1"

  @done
  Scenario: Creating a subsection without a name is bad
    When I fill in "Name" with ""
    And I press "Create Subsection"
    Then I should see "Subsection has not been created."
    And I should see "Name can't be blank"

  @done
  Scenario: Creating a subsection without a description is bad
    When I fill in "Description" with ""
    And I press "Create Subsection"
    Then I should see "Subsection has not been created."
    And I should see "Description can't be blank"

  @done
  Scenario: Creating an existing subsection is bad
    Given there is a subsection which description is "Smoushond"
    When I fill in "Description" with "Smoushond"
    And I press "Create Subsection"
    Then I should see "Subsection has not been created."
    And I should see "Description has already been taken"