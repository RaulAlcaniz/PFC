Feature: Adding dog to a exhibition
  In order to add a dog to a exhibition
  As a user
  I want to add it easily

  Background:
    Given there are the following users:
      | email             | password |
      | user@testing.com  | password |
    And I am signed in as "user@testing.com"

    Given "user@testing.com" is owner for some dogs:
      | Name       | Date of birth | Sire | Dam   | Sex  | Titles           |
      | Snoopy     | 07/05/2010    | Rex  | Missy | Male | PORTO WINNER Jr. |
      | Scooby Doo | 27/01/2008    | Skip | Peggy | Male |                  |
    And "Snoopy" breed is "Australian Kelpie"
    And "Scooby Doo" breed is "Dachshund"

    Given there are exhibitions with these entries:
      | Name                 | Description     | Start date             | End date               |
      | TWK 139th Dog Show   | Not description | March 29, 2015 - 12:30 | March 30, 2015 - 12:30 |
      | Exp. Canina de Cieza | www.example.org | Sep 1, 2015 - 17:00    | Sep 3, 2015 - 20:00    |
    Given there are these entry deadlines for "Exp. Canina de Cieza":
      | Name               | Start date | End date   |
      | 1st entry deadline | 08-01-2014 | 22-02-2014 |
      | 2nd entry deadline | 23-02-2014 | 03-03-2014 |
      | 3rd entry deadline | 04-03-2014 | 14-03-2014 |

    Given there are these payments for partners in "Exp. Canina de Cieza":
      | Class           | Dogs              | 1st entry deadline | 2nd entry deadline | 3rd entry deadline |
      | J. I. A. T. CH. | 1st dog           | 24.00              | 30.00              | 36.00              |
      | J. I. A. T. CH. | 2nd dog           | 19.00              | 23.00              | 27.00              |
      | J. I. A. T. CH. | 3rd and following | 14.00              | 18.00              | 21.00              |
      | Veteran         | 1st dog           | 12.00              | 15.00              | 18.00              |
      | Veteran         | 2nd dog           | 9.50               | 11.50              | 13.50              |
      | Veteran         | 3rd and following | 7.00               | 9.00               | 10.50              |
      | Puppy           | 1st dog           | 16.00              | 20.00              | 24.00              |
      | Puppy           | 2nd dog           | 12.00              | 15.00              | 18.00              |
      | Puppy           | 3rd and following | 9.00               | 12.00              | 15.00              |
      | Couple          |                   | 20.00              | 25.00              | 29.00              |
      | Group Breeding  |                   | 0.00               | 0.00               | 0.00               |

    And there are these payments for no partners in "Exp. Canina de Cieza":
      | Class           | Dogs              | 1st entry deadline | 2nd entry deadline | 3rd entry deadline |
      | J. I. A. T. CH. | 1st dog           | 30.00              | 37.50              | 43.50              |
      | J. I. A. T. CH. | 2nd dog           | 25.00              | 32.00              | 37.00              |
      | J. I. A. T. CH. | 3rd and following | 20.00              | 25.00              | 29.00              |
      | Veteran         | 1st dog           | 15.00              | 18.75              | 21.75              |
      | Veteran         | 2nd dog           | 12.50              | 16.00              | 18.50              |
      | Veteran         | 3rd and following | 10.00              | 12.50              | 14.50              |
      | Puppy           | 1st dog           | 21.00              | 27.00              | 31.00              |
      | Puppy           | 2nd dog           | 15.00              | 19.00              | 21.00              |
      | Puppy           | 3rd and following | 11.00              | 14.00              | 17.00              |
      | Couple          |                   | 25.00              | 32.00              | 37.00              |
      | Group Breeding  |                   | 0.00               | 0.00               | 0.00               |

    Given I am on the exhibitions page
    And I follow "Exp. Canina de Cieza"
    And I press "Enter a new dog"
    Then I should be on the "inscribe dog" page

  @actual
  Scenario: Add a dog into a exhibition which I have no one and I'm partner
    Given today is "10-02-2014"
    When I select "Snoopy" from "Dogs"
    And I select "Champion Class" from "Class"
    And I check "Partner"
    Then I should see "Price:" and "24.00"
    When I press "Save this dog"
    Then I should be on the "exhibition dog" page
    And I should see "Snoopy" and "Champion Class"
    And I should see "24.00"
    And I should see "Total" and "24.00"

  @pending
  Scenario: Add a dog into a exhibition which I have another one and I'm partner
    Given today is "6-03-2014"
    Given I have "Snoopy" added in "Exp. Canina de Cieza"
    When I select "Scooby Doo" from "Dogs"
    And I select "Open Class" from "Class"
    And I check "Partner"
    Then I should see "Price:" and "27.00"
    When I press "Save this dog"
    Then I should be on the "exhibition dog" page
    And I should see "Snoopy" and "Champion Class"
    And I should see "24.00"
    And I should see "Scooby Doo" and "Open Class"
    And I should see "27.00"
    And I should see "Total" and "51.00"

  @pending
  Scenario: Add a dog into a exhibition which I have no one and I'm not partner
    Given today is "25-02-2014"
    When I select "Snoopy" from "Dogs"
    And I select "Champion Class" from "Class"
    And I uncheck "Partner"
    Then I should see "Price:" and "37.50"
    When I press "Save this dog"
    Then I should be on the "exhibition dog" page
    And I should see "Snoopy" and "Champion Class"
    And I should see "37.50"
    And I should see "Total" and "37.50"