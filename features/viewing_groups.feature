Feature: Viewing groups
  Groups are a container of sections. Groups have one identifier, one name and one description each.

  We can see in the next table an example of 3 groups:

  """
  |GROUP ID|Name     |Description                                         |
  |1       |Group I  |Sheepdogs and Cattle Dogs (except Swiss Cattle Dogs)|
  |2       |Group III|Terriers                                            |
  |3       |Group IX |Companion and Toy Dogs                              |
  """

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
  Scenario: A visit wants see a specific group properties
    When the standards and nomenclature page is visited
    And I follow "Group I"
    Then I should be on the group page for "Group I"
    And I should see "Group I" within "#groups h2"