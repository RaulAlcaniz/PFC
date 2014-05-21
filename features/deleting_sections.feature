Feature: Deleting Sections
  In order to remove sections
  As a user
  I want to press a button and make it disappear

  Background:
    Given there is a group called "Group I"
    And there are sections for this group:
      |Section number|Description|
      |1             |Sheepdogs  |
    And I am on the groups page
    When I follow "Group I"
    And I follow "Sheepdogs"

  @done
  Scenario: Deleting a section
    When I follow "Delete Section"
    Then I should see "Section has been deleted."
    And I should be on the group page for "Group I"
    And I should not see "Sheepdogs"