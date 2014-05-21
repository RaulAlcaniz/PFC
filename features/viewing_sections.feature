Feature: Viewing sections
  In order to view the sections for a group
  As a user
  I want to see them on that group's page

  Background:
    Given there is a group called "Group I"
    And there are sections for this group:
      |Section number|Description                    |
      |1             |Sheepdogs                      |

    Given there is a group called "Group II"
    And there are sections for this group:
      |Section number|Description                    |
      |1             |Large and medium-sized Terriers|

    Given I am on the groups page

  @done
  Scenario: Viewing sections for a given group
    When I follow "Group I"
    Then I should see "Sheepdogs"
    And I should not see "Large and medium-sized Terriers"
    When I follow "Sheepdogs"
    Then I should see "1" within "#sections h2"
    And I should see "Sheepdogs"

    When I follow "Standards and nomenclature page"
    And I follow "Group II"
    Then I should not see "Sheepdogs"
    And I should see "Large and medium-sized Terriers"
    When I follow "Large and medium-sized Terriers"
    Then I should see "1" within "#sections h2"
    And I should see "Large and medium-sized Terriers"