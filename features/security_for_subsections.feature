Feature: Security for subsections
  In order to protect subsections information
  As a no admin user
  I should not be able to change subsections information

  Background:
    Given there are the following users:
      | email              | password | admin  |
      | admin@testing.com  | password | true   |
      | user@testing.com   | password | false  |
    And I am signed in as "user@testing.com"

    Given there is a group called "Group II"
    And there are sections for this group:
      |Section number|Description                |
      |Section 1     |Pinscher and Schnauzer type|
    And there are subsections for the section with section number "Section 1":
      |Subsection number|Description|
      |Subsection 1     |Pinscher   |
    And I am on the section page for "Section 1"

  @done
  Scenario: Creating a subsection when the user is not an admin is bad
    When I follow "New Subsection"

    Then I should be redirected to the home page
    And I should see "You can't access to this page."

  @done
  Scenario: Deleting a subsection when the user is not an admin is bad
    When I follow "Pinscher"
    And I follow "Delete Subsection"

    Then I should be redirected to the home page
    And I should see "You can't access to this page."

  @done
  Scenario: Updating a subsection when the user is not an admin is bad
    When I follow "Pinscher"
    And I follow "Edit Subsection"

    Then I should be redirected to the home page
    And I should see "You can't access to this page."


