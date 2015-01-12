@time_travel
Feature: Creating payments
  In order to get my payments
  As a user
  I want to create it easily

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
      | Name                 | Description     | Start date  | End date    |
      | Exp. Canina de Cieza | www.example.org | Sep 1, 2014 | Sep 3, 2014 |

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

    Given I have "Snoopy" enrolled in "Exp. Canina de Cieza" in "Champion" class on "10-02-2014"
    And I have "Scooby Doo" enrolled in "Exp. Canina de Cieza" in "Open" class on "11-02-2014"

    Given I am on the enrolments page for "Exp. Canina de Cieza"
    Then I should see "TOTAL" and "43.00"
    When I press "Upload the Bank Receipt"

  @done
  Scenario: Creating payments
    When I fill in "Comment" with "Bank receipt for Snoopy and Scooby Doo"
    And I attach the file "receipt_example.txt" to "Receipt"

    When I press "Create Payment"
    Then I have sent the payment of "Snoopy and Scooby Doo" for "Champion and Open" class
    And I should see "Payment has been uploaded."

  @done
  Scenario: Creating payments without a bank receipt is bad
    When I press "Create Payment"
    Then I should see "Payment has not been uploaded"
    Then I should see "You must select a file to attach."
