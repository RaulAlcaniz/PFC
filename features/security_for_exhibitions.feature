#@time_travel
#Feature: Security for exhibitions
#  In order to protect exhibitions information
#  As a no admin user
#  I should not be able to change exhibitions information
#
#  Background:
#    Given there are the following users:
#      | email              | password | admin  |
#      | admin@testing.com  | password | true   |
#      | user@testing.com   | password | false  |
#      | boy@testing.com    | password | false  |
#
#    And I am signed in as "user@testing.com"
#
#    Given today is "April 7, 2014"
#    Given there are exhibitions with these entries:
#      | Name                | Description     | Start date          | End date            |
#      | TWK 139th Dog Show  | Not description | May 7, 2014 - 12:30 | May 7, 2014 - 20:30 |
#      | 9th Annual Dog Show | www.example.org | Sep 1, 2014 - 17:00 | Sep 3, 2014 - 20:00 |
#
#    Given I am on the exhibitions page

#  @done
#  Scenario: Creating exhibitions when the user is not an admin is bad
#    When I follow "New Exhibition"
#
#    Then I should be redirected to the home page
#    And I should see "You can't access to this page."

#  @done
#  Scenario: Deleting exhibitions when the user is not an admin is bad
#    Given there is an exhibition called "9th Annual Dog Show"
#    And I am on the exhibition page for "9th Annual Dog Show"
#    When I follow "Delete Exhibition"
#
#    Then I should be redirected to the home page
#    And I should see "You can't access to this page."

#  @done
#  Scenario: Updating a exhibition when the user is not an admin is bad
#    Given I am on the exhibition page for "TWK 139th Dog Show"
#    And I follow "Edit Exhibition"
#
#    Then I should be redirected to the home page
#    And I should see "You can't access to this page."



