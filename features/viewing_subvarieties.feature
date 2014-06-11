Feature: Viewing varieties
  In order to view the varieties for a breed variety
  As a user
  I want to see them on that breed variety page

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

    Given I am on the breed page for "Dobermann"
    And I follow "Standard"

  @actual
  Scenario: Viewing subvarieties for a breed variety
    Then I should see "Smooth-haired"
    And I should see "Long-haired"
    And I should see "Wire-haired"

    When I follow "Smooth-haired"
    Then I should see "Smooth-haired" within "#subvarieties h2"