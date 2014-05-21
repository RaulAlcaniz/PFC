Feature: Creating subsections
  In order to create subsections for sections
  As a user
  I want to be able to select a section and do it

  Background:
    Given there is a group called "Group II"
    And there are sections for this group:
      |SECTION ID|GROUP ID|Section number|Description                |
      |1         |2       |1             |Pinscher and Schnauzer type|
    And I am on the section page for "1"
    When I follow "New Subsection"
   # Then I should see una div con el nombre: formulario de nueva subsección con campos nombre, descripción?

  @done
  Scenario: Creating a subsection
    When I fill in "Name" with "1"
    And I fill in "Description" with "Pinscher"
    And I press "Create Subsection"
    Then I should see "Subsection has been created."
    And I should be on the section page for "1"

  @done
  Scenario: Creating a subsection without a name
    When I fill in "Name" with ""
    And I press "Create Subsection"
    Then I should see "Subsection has not been created."
    And I should see "Name can't be blank"

  @done
  Scenario: Creating a subsection without a description
    When I fill in "Description" with ""
    And I press "Create Subsection"
    Then I should see "Subsection has not been created."
    And I should see "Description can't be blank"