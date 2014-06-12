Feature: Creating Subvarieties
  In order to create subvarieties for some breed variety
  As a user
  I want to create them easily

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

    Given I am on the variety page for "Standard"
    When I follow "New Subvariety"

  @done
  Scenario: Creating a subvariety
    When I fill in "Name" with "Smooth-haired"
    And I press "Create Subvariety"
    Then I should see "Subvariety has been created."
    And I should be on the subvariety page for "Smooth-haired"

  @done
  Scenario: Creating a subvariety without a name
    When I fill in "Name" with ""
    And I press "Create Subvariety"
    Then I should see "Subvariety has not been created."
    And I should see "Name can't be blank"