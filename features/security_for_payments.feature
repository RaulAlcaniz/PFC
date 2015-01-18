@time_travel
Feature: Security for payments
  In order to protect payments information
  As a no admin user
  I should not be able to change payments information for other people

  Background:
    Given today is "10-12-2013"
    Given there are the following users:
      | email              | password | admin  |
      | admin@testing.com  | password | true   |
      | user@testing.com   | password | false  |
      | bad@testing.com    | password | false  |

    Given "user@testing.com" is owner for some dogs:
      | Name       | Date of birth | Sire    | Dam   | Sex  | Titles           |
      | Snoopy     | 12/12/2012    | Rex     | Missy | Male | PORTO WINNER Jr. |

    Given the exhibition "Exp. Canina de Cieza" exists
    Given the exhibition "TWK 139th Dog Show" exists
    And "user@testing.com" has "Snoopy" enrolled in "Exp. Canina de Cieza"

    And the payment of "Snoopy" for "Champion" class is sending and "pending"

  @done
  Scenario: Access to the payments page when I'm not the owner is bad
    Given I am signed in as "bad@testing.com"
    When I try to "view" the payments for "user@testing.com" in "Exp. Canina de Cieza"

    Then I should be redirected to the home page
    And I should see "The payment you were looking for could not be found."

  @done
  Scenario: Trying to edit the payments page when I'm not the owner is bad
    Given I am signed in as "bad@testing.com"
    When I try to "edit" the payments for "user@testing.com" in "Exp. Canina de Cieza"

    Then I should be redirected to the home page
    And I should see "The payment you were looking for could not be found."

  @done
  Scenario: Trying to access to a nonexistent payment is bad
    Given I am signed in as "admin@testing.com"
    When I try to access to a invalid payment

    Then I should be redirected to the home page
    And I should see "The payment you were looking for could not be found."