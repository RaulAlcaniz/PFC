Feature: Security for sections
  In order to protect sections information
  As a no admin user
  I should not be able to change sections information

  Background:
    Given there are the following users:
      | email              | password | admin  |
      | admin@testing.com  | password | true   |
      | user@testing.com   | password | false  |
    And I am signed in as "user@testing.com"

    Given there is a group called "Group I"
    And there are sections for this group:
      |Section number|Description|
      |Section 2     |Cattledogs |

    And I am on the groups page
    When I follow "Group I"

#  @done
#  Scenario: Creating a section when the user is not an admin is bad
#    When I follow "New Section"
#
#    Then I should be redirected to the home page
#    And I should see "You can't access to this page."
#
#  @done
#  Scenario: Deleting a section when the user is not an admin is bad
#    Given I am on the section page for "Section 2"
#    And I follow "Delete Section"
#
#    Then I should be redirected to the home page
#    And I should see "You can't access to this page."
#
#  @done
#  Scenario: Editing a section when the user is not an admin is bad
#    Given I am on the section page for "Section 2"
#    And I follow "Edit Section"
#
#    Then I should be redirected to the home page
#    And I should see "You can't access to this page."