Feature: Viewing groups
  In order to view groups
  As a user
  I want to see them on the groups page

  Background:
    There are groups with a name and a description
    Given groups with these entries:
      |Name       |Description                                        |
      |Group I    |Sheepdogs and Cattle Dogs (except Swiss Cattle Dog)|
      |Group III  |Terriers                                           |
      |Group IX   |Companion and Toy Dogs                             |
  @done
  Scenario: A visit wants see what groups are defined
    When the standards and nomenclature page is visited
    Then the standards and nomenclature page should content:
      |Name       |Description                                        |
      |Group I    |Sheepdogs and Cattle Dogs (except Swiss Cattle Dog)|
      |Group III  |Terriers                                           |
      |Group IX   |Companion and Toy Dogs                             |

  @done
  Scenario: Viewing a specific group properties
    When the standards and nomenclature page is visited
    And I follow "Group I"
    Then I should be on the group page for "Group I"
    And I should see "Group I" within "#groups h2"