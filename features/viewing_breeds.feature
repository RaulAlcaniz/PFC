Feature: Viewing breeds
  In order to view the breeds for a section/subsection
  As a user
  I want to see them on the section/subsection's page

  Background:
    Given there is a group called "Group III"
    And there are sections for this group:
      |Section number|Description         |
      |Section 2     |Small-sized Terriers|
    And there are some breeds for the section number "Section 2":
      |Name                |
      |Australian Terrier  |
      |Jack Russell Terrier|

    Given there is a group called "Group II"
    And there are sections for this group:
      |Section number|Description                |
      |Section 1     |Pinscher and Schnauzer type|
    And there are subsections for the section with section number "Section 1":
      |Subsection number|Description|
      |Subsection 1.1   |Pinscher   |
      |Subsection 1.2   |Schnauzer  |
    And there are some breeds for the subsection with subsection number "Subsection 1.1":
      |Name                     |
      |Dobermann                |
      |Österreichischer Pinscher|

    Given I am on the groups page

    @done
    Scenario: Viewing breeds for a section
      When I follow "Group III"
      And I follow "Small-sized Terriers"
      Then I should be on the section page for "Section 2"
      And I should see "Australian Terrier" within "#breeds"
      And I should see "Jack Russell Terrier" within "#breeds"
      But I should not see "Dobermann"

      When I follow "Australian Terrier"
      Then I should be on the breed page for "Australian Terrier"

    @done
    Scenario: Viewing breeds for a subsection
      When I follow "Group II"
      And I follow "Pinscher and Schnauzer type"
      And I follow "Pinscher"
      Then I should be on the subsection page for "Subsection 1.1":
      And I should see "Dobermann" within "#breeds"
      And I should see "Österreichischer Pinscher" within "#breeds"
      But I should not see "Australian Terrier"

      When I follow "Dobermann"
      Then I should be on the breed page for "Dobermann"