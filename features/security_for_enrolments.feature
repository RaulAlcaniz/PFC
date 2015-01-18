@time_travel
Feature: Security for enrolments
  In order to protect enrolments information
  As a no admin user
  I should not be able to change enrolments information if I'm not the owner

  Background:
    Given today is "10-12-2013"
    Given there are the following users:
      | email              | password | admin  |
      | admin@testing.com  | password | true  |
      | user@testing.com   | password | false  |
      | bad@testing.com    | password | false  |

    Given "user@testing.com" is owner for some dogs:
      | Name       | Date of birth | Sire    | Dam   | Sex  | Titles                    |
      | Snoopy     | 12/12/2012    | Rex     | Missy | Male | PORTO WINNER Jr.          |

    Given the exhibition "Exp. Canina de Cieza" exists
    And "user@testing.com" has "Snoopy" enrolled in "Exp. Canina de Cieza"

    And the payment of "Snoopy" for "Champion" class is sending and "pending"


  @done
  Scenario: Trying to see an enrolment of another user when I'm not an admin is bad
    Given I am signed in as "bad@testing.com"
    When I try to "view" the enrolments for "user@testing.com" in "Exp. Canina de Cieza"
    Then I should be redirected to the home page
    And I should see "You can't access to this page."

  @done
  Scenario: Updating a exhibition when the user is not the owner is bad
    Given I am signed in as "bad@testing.com"
    When I try to "create" the enrolments for "user@testing.com" in "Exp. Canina de Cieza"
    Then I should be redirected to the home page
    And I should see "You can't access to this page."

  @done
  Scenario: An admin can't access to my enrolments page
    Given I am signed in as "admin@testing.com"
    When I try to access to a user enrolments page "Exp. Canina de Cieza" as admin
    Then I should be redirected to the home page
    And I should see "You can't access to this page."
