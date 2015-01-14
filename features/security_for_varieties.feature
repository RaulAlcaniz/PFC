Feature: Security for varieties
  In order to protect varieties information
  As a no admin user
  I should not be able to change varieties information

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

    Given I am on the breed page for "Dobermann"

  @done
  Scenario: Creating a variety when the user is not an admin is bad
    When I follow "New Variety"

    Then I should be redirected to the home page
    And I should see "You can't access to this page."

  @done
  Scenario: Deleting a variety when the user is not an admin is bad
    Given I am on the variety page for "Black with rust red markings"
    When I follow "Delete Variety"

    Then I should be redirected to the home page
    And I should see "You can't access to this page."

  @done
  Scenario: Updating a variety when the user is not an admin is bad
    Given I am on the variety page for "Black with rust red markings"
    When I follow "Edit Variety"

    Then I should be redirected to the home page
    And I should see "You can't access to this page."