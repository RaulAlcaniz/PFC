Feature: Creating breeds
  In order to create breeds for some sections/subsections
  As a user
  I want to create them easily when I'm an admin

  Background:
    Given there are the following users:
      | email              | password | admin  |
      | admin@testing.com  | password | true   |
      | user@testing.com   | password | false  |
    And I am signed in as "admin@testing.com"

    Given there is a group called "Group III"
    And there are sections for this group:
      |Section number|Description         |
      |Section 2     |Small-sized Terriers|

    Given there is a group called "Group II"
    And there are sections for this group:
      |Section number|Description                |
      |Section 1     |Pinscher and Schnauzer type|
    And there are subsections for the section with section number "Section 1":
      |Subsection number|Description|
      |Subsection 1.1   |Pinscher   |

    Given I am on the groups page

  @done
  Scenario: Creating a breed for a section
    When I follow "Group III"
    And I follow "Small-sized Terriers"
    And I follow "New Breed"
    When I fill in "Name" with "Terrier Brasileiro"
    And I press "Create Breed"
    Then I should see "Breed has been created."
    And I should be on the breed page for "Terrier Brasileiro"

  @done
  Scenario: Creating a breed for a subsection
    When I follow "Group II"
    And I follow "Pinscher and Schnauzer type"
    And I follow "Pinscher"
    And I follow "New Breed"
    When I fill in "Name" with "Dobermann"
    And I press "Create Breed"
    Then I should see "Breed has been created."
    And I should be on the breed page for "Dobermann"

  @done
  Scenario: Creating a breed without a name
    When I follow "Group III"
    And I follow "Small-sized Terriers"
    And I follow "New Breed"

    When I fill in "Name" with ""
    And I press "Create Breed"
    Then I should see "Breed has not been created."
    And I should see "Name can't be blank"

  @done
  Scenario: Creating a breed with a name already taken
    Given there is a breed called "Dobermann"

    When I follow "Group III"
    And I follow "Small-sized Terriers"
    And I follow "New Breed"

    When I fill in "Name" with "Dobermann"
    And I press "Create Breed"
    Then I should see "Breed has not been created."
    And I should see "Name has already been taken"