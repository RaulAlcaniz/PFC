Feature: Security for breeds
  In order to protect breeds information
  As a no admin user
  I should not be able to change breeds information

  Background:
    Given there are the following users:
      | email              | password | admin  |
      | admin@testing.com  | password | true   |
      | user@testing.com   | password | false  |
    And I am signed in as "user@testing.com"

    Given there is a group called "Group III"
    And there are sections for this group:
      |Section number|Description         |
      |Section 2     |Small-sized Terriers|

    And there are some breeds for the section number "Section 2":
      |Name                |
      |Australian Terrier  |

    Given I am on the groups page

#  @done
#  Scenario: Creating a breed when the user is not an admin is bad
#    When I follow "Group III"
#    And I follow "Small-sized Terriers"
#    And I follow "New Breed"
#
#    Then I should be redirected to the home page
#    And I should see "You can't access to this page."

#  @done
#  Scenario: Deleting a breed when the user is not an admin is bad
#    Given I am on the section page for "Section 2"
#    And I follow "Australian Terrier"
#    And I follow "Delete Breed"
#
#    Then I should be redirected to the home page
#    And I should see "You can't access to this page."

#  @done
#  Scenario: Updating a breed when the user is not an admin is bad
#    Given I am on the section page for "Section 2"
#    And I follow "Australian Terrier"
#    And I follow "Edit Breed"
#
#    Then I should be redirected to the home page
#    And I should see "You can't access to this page."