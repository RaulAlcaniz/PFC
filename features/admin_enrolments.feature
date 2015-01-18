@time_travel
Feature: Admin enrolments
  In order to manage enrolments
  As a admin
  I want to be able to manage enrolments when I'm admin

  Background:
    Given today is "10-12-2013"
    Given there are the following users:
      | email              | password | admin  |
      | admin@testing.com  | password | true   |
      | user@testing.com   | password | false  |

    Given "user@testing.com" is owner for some dogs:
      | Name       | Date of birth | Sire    | Dam   | Sex  | Titles                    |
      | Snoopy     | 12/12/2012    | Rex     | Missy | Male | PORTO WINNER Jr.          |
      | Dundee     | 25/10/2012    | Arthur  | Adele | Male | CRUFTS QUALIFICATION, CH. |

    Given the exhibition "Exp. Canina de Cieza" exists
    Given the exhibition "TWK 139th Dog Show" exists
    And "user@testing.com" has "Snoopy" enrolled in "Exp. Canina de Cieza"
    And "user@testing.com" has "Dundee" enrolled in "Exp. Canina de Cieza"

    And the payment of "Snoopy" for "Champion" class is sending and "pending"
    And the payment of "Dundee" for "Champion" class is not sending

    Given I am signed in as "admin@testing.com"

  @done
  Scenario: I should not have enrolments to view in the exhibitions page
    Given today is "01-01-2015"
    Given I am on the exhibitions page

    And I should not see "View enrolments"
    And I should be able to "view" the "exhibition" "Exp. Canina de Cieza"

  @done
  Scenario: Admin can't enroll a dog for another user
    Given I am on the admin enrolments page for "TWK 139th Dog Show" for "user@testing.com"
    Then I should see "You haven't dogs enrolled in this exhibition."
    And I should not be able to enroll a dog

    When I follow "Sign out"
    And I am signed in as "user@testing.com"
    Given I am on the enrolments page for "Exp. Canina de Cieza"

    Then I should be able to enroll a dog

  @done
  Scenario: Admin can't upload a bank receipt for another user
    Given I am on the admin enrolments page for "Exp. Canina de Cieza" for "user@testing.com"
    Then I should not be able to upload a bank receipt

    When I follow "Sign out"
    And I am signed in as "user@testing.com"
    Given I am on the enrolments page for "Exp. Canina de Cieza"

    Then I should be able to upload a bank receipt