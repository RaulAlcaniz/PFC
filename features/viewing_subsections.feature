Feature: Viewing sections
  In order to view the subsections for a section
  As a user
  I want to see them on that section group's page

  Background:
    Given there is a group called "Group II"
    And there are sections for this group:
      |SECTION ID|GROUP ID|Section number|Description                |
      |1         |2       |1             |Pinscher and Schnauzer type|
      |2         |2       |2             |Molossoid breeds           |
    And there are subsections for the section with section number "1":
      |Subsection number|Description|
      |1                |Pinscher   |
      |2                |Schnauzer  |
      |3                |Smoushond  |

    Given there is a group called "Group IX"
    And there are sections for this group:
      |SECTION ID|GROUP ID|Section number|Description               |
      |3         |9       |1             |Bichons and related breeds|
    And there are subsections for the section with section number "1":
      |Subsection number|Description    |
      |1                |Bichons        |
      |2                |Coton de Tuléar|

    Given I am on the groups page

  @done
  Scenario: Viewing subsections for a given section
    When I follow "Group II"
 #   Then I should see "/^Pinscher$/" within "#subsection" debería ser exactamente esta palabra para que no se confunda con el título, además cómo lo hago para decir que está dentro del tag ese?
 #   Debería controlar los 1.1, 2.1, etc. Es decir, poner mas casos, por ejemplo que haya 2.1 y/o que no haya 2.1, etc?
    Then I should see "1.1"
    And I should see "Pinscher"
    And I should see "1.2"
    And I should see "Schnauzer"
    And I should see "1.3"
    And I should see "Smoushond"
    But I should not see "2.1"
    And I should not see "Bichons"
    But I should not see "2.2"
    And I should not see "Coton de Tuléar"
    When I follow "Pinscher and Schnauzer type"
    Then I should see "1" within "#sections h2"
    And I should see "Pinscher"
    And I should see "Schnauzer"
    And I should see "Smoushond"
    But I should not see "Bichons"

    When I follow "Standards and nomenclature page"
    And I follow "Group IX"
    Then I should not see "Pinscher"
    And I should not see "Schnauzer"
    And I should not see "Smoushond"
    But I should see "1.1"
    And I should see "Bichons"
    And I should see "1.2"
    And I should see "Coton de Tuléar"
    When I follow "Bichons and related breeds"
    Then I should see "1" within "#sections h2"
    And I should see "Bichons"
    And I should see "Coton de Tuléar"
    But I should not see "Pinscher"