Feature: Editing breeds
  In order to In order to alter a breed information
  As a user
  I want a form to edit the breed

  Background:
    Given there is a group called "Group II"
    And there are sections for this group:
      |Section number|Description                |
      |Section 1     |Pinscher and Schnauzer type|
    And there are subsections for the section with section number "Section 1":
      |Subsection number|Description|
      |Subsection 1.1   |Pinscher   |
      |Subsection 1.2   |Schnauzer  |
    And there are some breeds for the subsection with subsection number "Subsection 1.1":
      |Name     |
      |Dobermann|

    Given there is a group called "Group III"
    And there are sections for this group:
      |Section number|Description         |
      |Section 2     |Small-sized Terriers|
    And there are some breeds for the section number "Section 2":
      |Name              |
      |Australian Terrier|

  @done
  Scenario: Updating a breed for a section
    Given I am on the section page for "Section 2"
    And I follow "Australian Terrier"
    And I follow "Edit Breed"

    When I fill in "Name" with "beta"
    And I press "Update Breed"
    Then I should see "Breed has been updated."
    And I should be on the breed page for "beta"
    And I should see "beta" within "#breeds"
    But I should not see "Australian Terrier" within "#breeds"

  @done
  Scenario: Creating a breed for a subsection
    Given I am on the subsection page for "Subsection 1.1"
    And I follow "Dobermann"
    And I follow "Edit Breed"

    When I fill in "Name" with "beta 2"
    And I press "Update Breed"
    Then I should see "Breed has been updated."
    And I should be on the breed page for "beta 2"
    And I should see "beta" within "#breeds"
    But I should not see "Australian Terrier" within "#breeds"

  @done
  Scenario: Creating a breed without a name is bad
    Given I am on the section page for "Section 2"
    And I follow "Australian Terrier"
    And I follow "Edit Breed"

    When I fill in "Name" with ""
    And I press "Update Breed"
    Then I should see "Breed has not been updated."
    And I should see "Name can't be blank"

  @done
  Scenario: Updating a breed with a name already taken is bad
    Given I am on the section page for "Section 2"
    And I follow "Australian Terrier"
    And I follow "Edit Breed"

    When I fill in "Name" with "Dobermann"
    And I press "Update Breed"
    Then I should see "Breed has not been updated."
    And I should see "Name has already been taken"