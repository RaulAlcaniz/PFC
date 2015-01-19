Feature: Security for people
  In order to protect people information
  As a no admin user
  I should not be able to change people information

  Background:
    Given there are the following users:
      | email              | password | admin  |
      | admin@testing.com  | password | true   |
      | user@testing.com   | password | false  |

    Given I am signed in as "user@testing.com"

#  @done
#  Scenario: Access to the people page when the user is not an admin is bad
#    When I follow "People page"
#
#    Then I should be redirected to the home page
#    And I should see "You can't access to this page."

  @done
  Scenario: Creating a person when the user is not an admin is bad
    When I try to access to "New Person" page

    Then I should be redirected to the home page
    And I should see "You can't access to this page."

  @done
  Scenario: Trying to access to the another user profile when the user is not an admin is bad
    And there is a person called "Dorothy Oz"
    When I try to access to the person page for "Dorothy Oz"

    Then I should be redirected to the home page
    And I should see "You can't access to this page."