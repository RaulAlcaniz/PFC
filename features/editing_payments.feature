@time_travel
Feature: Editing payments
  In order to edit payments
  As user
  I want to update a comment or re-upload a bank receipt easily

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

    Given today is "15-03-2014"

    Given I have "Snoopy" enrolled in "Exp. Canina de Cieza" in "Champion" class on "10-02-2014"
    And I have sent the payment of "Snoopy" for "Champion" class
    And the payment status of "Snoopy" for "Champion" class is "accepted"

    Given I have "Scooby Doo" enrolled in "Exp. Canina de Cieza" in "Open" class on "11-02-2014"
    And I have sent the payment of "Scooby Doo" for "Open" class
    And the payment status of "Scooby Doo" for "Open" class is not "accepted"

    Given I am on the enrolments page for "Exp. Canina de Cieza"
    Then I should see "See Payment" for the payment of "Scooby Doo"
    And I should see "See Payment" for the payment of "Snoopy"

  @done
  Scenario: Update a payment
    When I follow "See Payment" for the dog "Scooby Doo"
    Then I should be on the payment page for "Scooby Doo"
    And I should see "Status:"
    And I should not see "Accepted"
    And I should see "Edit Payment"
    When I follow "Edit Payment"

    When I fill in "Comment" with "Bank receipt for Scooby Doo"
    And I attach the file "receipt_example.txt" to "Receipt"

    When I press "Update Payment"
    Then I have sent the payment of "Scooby Doo" for "Open" class
    And I should see "Payment has been updated."

  @done
  Scenario: Payment already accept can't be updated
    When I follow "See Payment" for the dog "Snoopy"
    Then I should be on the payment page for "Snoopy"
    And I should see "Status:" and "Accepted"
    And I should not see "Edit Payment"

  @done
  Scenario: Payment for exhibitions already finished can't be updated
    Given today is "04-09-2014"
    Then the exhibition "Exp. Canina de Cieza" has already finished

    When I follow "See Payment" for the dog "Scooby Doo"
    Then I should be on the payment page for "Scooby Doo"
    And I should see "The exhibition has already finished."
    And I should not see "Edit Payment"

  @done
  Scenario: Payment for exhibitions already finished can't be updated
    Given today is "04-09-2014"
    Then the exhibition "Exp. Canina de Cieza" has already finished

    Given I am on the person page for "user@testing.com"
    When I follow "My payments"
    When I follow "Edit" for "Scooby Doo" payment

    And I should see "The exhibition has already finished."
    And I should be redirected to the enrolments page for "Exp. Canina de Cieza"
