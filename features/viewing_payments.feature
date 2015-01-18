@time_travel
Feature: Viewing payments
  In order to view payments
  As user
  I want to see payments which already I have uploaded

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

  @done
  Scenario: Viewing my payments page
    Given I have "Scooby Doo" enrolled in "Exp. Canina de Cieza" in "Open" class on "11-02-2014"
    And I have "Snoopy" enrolled in "Exp. Canina de Cieza" in "Champion" class on "11-02-2014"
    And I have sent the payment of "Scooby Doo and Snoopy" for "Open and Champion" class

    Given I am on the person page for "user@testing.com"
    When I follow "My payments"
    Then I should be on the payments page for "user@testing.com"
    And the payments page should content:
      |Dogs                  |Exhibition          |Amount|Status    |Payment deadline|See | Edit |
      |Snoopy and Scooby Doo |Exp. Canina de Cieza|43.00 |unverified|Open            |View| Edit |

  @done
  Scenario: Viewing payments already uploaded for one dog
    Given I have "Scooby Doo" enrolled in "Exp. Canina de Cieza" in "Open" class on "11-02-2014"
    And I have sent the payment of "Scooby Doo" for "Open" class
    Given I have "Snoopy" enrolled in "Exp. Canina de Cieza" in "Champion" class on "10-02-2014"
    And I have not sent the payment of "Snoopy" for "Champion" class

    When I am on the enrolments page for "Exp. Canina de Cieza"
    Then I should see "See Payment" for the payment of "Scooby Doo"

    When I follow "See Payment" for the dog "Scooby Doo"
    Then I should be on the payment page for "Scooby Doo"
    And I should see "Payment for: Scooby Doo"
    And I should see "Status:" and "Comment:"
    And I should see "View the bank receipt"

    When I follow "View the bank receipt" for the dog "Scooby Doo"
    Then I should see the bank receipt for "Scooby Doo"

  @done
  Scenario: Viewing payments already uploaded for several dogs
    Given I have "Scooby Doo" enrolled in "Exp. Canina de Cieza" in "Open" class on "11-02-2014"
    And I have "Snoopy" enrolled in "Exp. Canina de Cieza" in "Champion" class on "11-02-2014"
    And I have sent the payment of "Scooby Doo and Snoopy" for "Open and Champion" class

    When I am on the enrolments page for "Exp. Canina de Cieza"
    Then I should see "See Payment" for the payment of "Scooby Doo and Snoopy"

    When I follow "See Payment" for the dogs "Scooby Doo and Snoopy"
    Then I should be on the payment page for "Scooby Doo and Snoopy"
    And I should see "Payment for: Scooby Doo and Snoopy"
    And I should see "Status:" and "Comment:"
    And I should see "View the bank receipt"

    When I follow "View the bank receipt" for the dogs "Scooby Doo and Snoopy"
    Then I should see the bank receipt for "Scooby Doo and Snoopy"