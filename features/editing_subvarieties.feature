Feature: Editing Subvarieties
  In order to alter a subvariety information
  As a user
  I want a form to edit the subvariety

  Background:
    Given there is a group called "Group IV"
    And there are sections for this group:
      |Section number|Description|
      |Section 1     |Dachshunds |
    And there are some breeds for the section number "Section 1":
      |Name     |
      |Dachshund|
    And there are varieties for the breed "Dachshund":
      |Name     |
      |Standard |
      |Miniature|
    And there are subvarities for the variety "Standard":
      |Name         |
      |Smooth-haired|
      |Long-haired  |
      |Wire-haired  |

    Given I am on the subvariety page for "Smooth-haired"
    And I follow "Edit Subvariety"

  @done
  Scenario: Updating a subvariety
    When I fill in "Name" with "beta"
    And I press "Update Subvariety"

    Then I should see "Subvariety has been updated."
    And I should be on the subvariety page for "beta"
    And I should see "beta" within "#subvarieties"
    But I should not see "Smooth-haired" within "#subvarieties"

  @done
  Scenario: Updating a subvariety without a name is bad
    When I fill in "Name" with ""
    And I press "Update Subvariety"
    Then I should see "Subvariety has not been updated."
    And I should see "Name can't be blank"