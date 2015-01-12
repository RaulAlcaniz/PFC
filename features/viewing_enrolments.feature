@time_travel
Feature: Viewing enrolments
  In order to view enrolments
  As user
  I want to see them on the enrolments page

  Background:
    Given today is "10-12-2013"
    Given there are the following users:
      | email             | password |
      | user@testing.com  | password |
    And I am signed in as "user@testing.com"

    Given "user@testing.com" is owner for some dogs:
      | Name       | Date of birth | Sire | Dam   | Sex  | Titles           |
      | Snoopy     | 12/12/2012    | Rex  | Missy | Male | PORTO WINNER Jr. |
      | Scooby Doo | 27/01/2008    | Skip | Peggy | Male |                  |

    Given there are exhibitions with these entries:
      | Name                  | Description     | Start date  | End date    |
      | Exp. Canina de Cieza  | www.example.org | Sep 1, 2014 | Sep 3, 2014 |
      | Amsterdam Winner Show | www.example.org | Sep 1, 2014 | Sep 3, 2014 |

    Given there are these entry deadlines for "Exp. Canina de Cieza":
      | Name               | Start date | End date   |
      | 1st entry deadline | 08-01-2014 | 22-02-2014 |
      | 2nd entry deadline | 23-02-2014 | 03-03-2014 |
      | 3rd entry deadline | 04-03-2014 | 14-03-2014 |

    Given there are these payments for "partners" in "Exp. Canina de Cieza":
      | Class           | Dogs              | 1st entry deadline | 2nd entry deadline | 3rd entry deadline |
      | J. I. O. W. CH. | 1st dog           | 24.00              | 30.00              | 36.00              |
      | J. I. O. W. CH. | 2nd dog           | 19.00              | 23.00              | 27.00              |
      | J. I. O. W. CH. | 3rd and following | 14.00              | 18.00              | 21.00              |

    And I have "Scooby Doo" enrolled in "Exp. Canina de Cieza" in "Open" class on "11-02-2014"
    And I have sent the payment of "Scooby Doo" for "Open" class
    And the payment status of "Scooby Doo" for "Open" class is "accepted"

    Given I have "Snoopy" enrolled in "Exp. Canina de Cieza" in "Champion" class on "10-02-2014"
    And I have not sent the payment of "Snoopy" for "Champion" class

  @done
  Scenario: Viewing enrolments from the exhibitions page
    Given I am on the exhibitions page
    When I follow "My enrolments" for "Exp. Canina de Cieza"
    Then I should be on the enrolments page for "Exp. Canina de Cieza"
    And I should see "Snoopy" and "Champion"
    And I should see "TOTAL" and "24.00"
    And I should see "Scooby Doo" and "Open"
    And I should see "19.00"
    And I should see "Status" and "Accepted"
    And I should see "See Payment" for the payment of "Scooby Doo"

  @done
  Scenario: Viewing enrolments from the profile
    Given I am on my profile page
    When I follow "My enrolments"
    Then I should be on the exhibitions page

    When I follow "My enrolments" for "Exp. Canina de Cieza"
    Then I should be on the enrolments page for "Exp. Canina de Cieza"
    And I should see "Snoopy" and "Champion"
    And I should see "TOTAL" and "24.00"
    And I should see "Scooby Doo" and "Open"
    And I should see "19.00"
    And I should see "Status" and "Accepted"
    And I should see "See Payment" for the payment of "Scooby Doo"

  @done
  Scenario: Viewing enrolments from the page of one exhibition
    Given I am on the exhibition page for "Exp. Canina de Cieza"
    Then I should see "My enrolments for Exp. Canina de Cieza"
    When I follow "My enrolments for Exp. Canina de Cieza"
    Then I should be on the enrolments page for "Exp. Canina de Cieza"
    And I should see "Snoopy" and "Champion"
    And I should see "TOTAL" and "24.00"
    And I should see "Scooby Doo" and "Open"
    And I should see "19.00"
    And I should see "Status" and "Accepted"
    And I should see "See Payment" for the payment of "Scooby Doo"

  @done
  Scenario: Trying to view enrolments in which I haven't dogs enrolled should be alerted
    Given I am on the enrolments page for "Amsterdam Winner Show"
    Then I should see "You haven't dogs enrolled in this exhibition."
    And I should see "Enroll a new dog" button

  @done
  Scenario: Enrolments that have receipts pending to upload in exhibitions
  already finished should not be displayed

    Given today is "04-09-2014"
    Then the exhibition "Exp. Canina de Cieza" has already finished

    Given I am on the exhibitions page
    When I follow "My enrolments" for "Exp. Canina de Cieza"
    Then I should be on the enrolments page for "Exp. Canina de Cieza"
    And I should not see "Snoopy" and "Champion"
    But I should see "Scooby Doo" and "Open"
    And I should see "Status" and "Accepted"
    And I should not see "Upload the Bank Receipt"

