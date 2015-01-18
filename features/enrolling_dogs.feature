@time_travel
Feature: Enrolling a dog in an exhibition
  In order to enroll a dog to an exhibition
  As a user
  I want to add it easily

  Background:
    Given today is "10-12-2013"
    Given there are the following users:
      | email             | password |
      | user@testing.com  | password |
    And I am signed in as "user@testing.com"

    Given "user@testing.com" is owner for some dogs:
      | Name       | Date of birth | Sire | Dam   | Sex    | Titles           |
      | Snoopy     | 12/12/2012    | Rex  | Missy | Male   | PORTO WINNER Jr. |
      | Scooby Doo | 27/01/2008    | Skip | Peggy | Male   |                  |
      | Pancho     | 27/01/2008    | Skip | Peggy | Male   |                  |
      | Lassie     | 02/02/2008    | Rolf | Linda | Female |                  |

    Given there are exhibitions with these entries:
      | Name                  | Description      | Start date   | End date     |
      | Exp. Canina de Cieza  | www.example.org  | Sep 1, 2014  | Sep 3, 2014  |
      | Amsterdam Winner Show | www.example.org  | Sep 15, 2014 | Sep 15, 2014 |

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
      | Veteran         | 1st dog           | 12.00              | 15.00              | 18.00              |
      | Veteran         | 2nd dog           | 9.50               | 11.50              | 13.50              |
      | Veteran         | 3rd and following | 7.00               | 9.00               | 10.50              |
      | Puppy           | 1st dog           | 16.00              | 20.00              | 24.00              |
      | Puppy           | 2nd dog           | 12.00              | 15.00              | 18.00              |
      | Puppy           | 3rd and following | 9.00               | 12.00              | 15.00              |
      | Couple          |                   | 20.00              | 25.00              | 29.00              |
      | Group Breeding  |                   | 0.00               | 0.00               | 0.00               |

    And there are these payments for "no partners" in "Exp. Canina de Cieza":
      | Class           | Dogs              | 1st entry deadline | 2nd entry deadline | 3rd entry deadline |
      | J. I. O. W. CH. | 1st dog           | 30.00              | 37.50              | 43.50              |
      | J. I. O. W. CH. | 2nd dog           | 25.00              | 32.00              | 37.00              |
      | J. I. O. W. CH. | 3rd and following | 20.00              | 25.00              | 29.00              |
      | Veteran         | 1st dog           | 15.00              | 18.70              | 21.75              |
      | Veteran         | 2nd dog           | 12.50              | 16.00              | 18.50              |
      | Veteran         | 3rd and following | 10.00              | 12.50              | 14.50              |
      | Puppy           | 1st dog           | 21.00              | 27.00              | 31.00              |
      | Puppy           | 2nd dog           | 15.00              | 19.00              | 21.00              |
      | Puppy           | 3rd and following | 11.00              | 14.00              | 17.00              |
      | Couple          |                   | 25.00              | 32.00              | 37.00              |
      | Group Breeding  |                   | 0.00               | 0.00               | 0.00               |

    Given "Amsterdam Winner Show" has the same specifications than "Exp. Canina de Cieza"
    Given I am on the exhibitions page
    And I follow "Exp. Canina de Cieza"

  @done
  Scenario: Enroll a first dog in an exhibition which I'm partner from the exhibition page
    Given today is "10-02-2014"
    And I press "Enroll a new dog"

    When I select "Snoopy" from "Dog"
    And I select "Champion" from "Class"
    And I check "Partner"
    When I press "Create Enrolment"
    Then I should see "Price:" and "24.00"
    When I press "Create Enrolment"
    Then "Snoopy" should be enrolled for "Exp. Canina de Cieza"
    And I should be on the enrolments page for "Exp. Canina de Cieza"
    And I should see "Inscription has been created"
    And I should see "Snoopy" and "Champion"
    And I should see "24.00"
    And I should see "TOTAL" and "24.00"

  @done
  Scenario: Enroll a fourth dog in an exhibition which I'm partner from the exhibition page
    Given I have "Snoopy" enrolled in "Exp. Canina de Cieza" in "Champion" class on "01-03-2014"
    And I have "Scooby Doo" enrolled in "Exp. Canina de Cieza" in "Open" class on "06-03-2014"
    And I have "Pancho" enrolled in "Exp. Canina de Cieza" in "Open" class on "06-03-2014"

    Given today is "6-03-2014"
    And I press "Enroll a new dog"

    When I select "Lassie" from "Dog"
    And I select "Open" from "Class"
    And I check "Partner"
    When I press "Create Enrolment"
    Then I should see "Price:" and "21.00"
    When I press "Create Enrolment"

    Then "Lassie" should be enrolled for "Exp. Canina de Cieza"
    And I should be on the enrolments page for "Exp. Canina de Cieza"
    And I should see "Inscription has been created"
    And I should see "Snoopy" and "Champion"
    And I should see "30.00"
    And I should see "Scooby Doo" and "Open"
    And I should see "27.00"
    And I should see "Pancho" and "Open"
    And I should see "21.00"
    And I should see "Lassie" and "Open"
    And I should see "21.00"
    And I should see "TOTAL" and "99.00"

  @done
  Scenario: Enroll a first dog in an exhibition which I'm not partner
    Given today is "25-02-2014"
    And I press "Enroll a new dog"

    When I select "Snoopy" from "Dog"
    And I select "Champion" from "Class"
    And I uncheck "Partner"
    When I press "Create Enrolment"
    Then I should see "Price:" and "37.50"
    When I press "Create Enrolment"
    Then "Snoopy" should be enrolled for "Exp. Canina de Cieza"
    And I should be on the enrolments page for "Exp. Canina de Cieza"
    And I should see "Inscription has been created"
    And I should see "Snoopy" and "Champion"
    And I should see "37.50"
    And I should see "TOTAL" and "37.50"

  @done
  Scenario: Enroll a dog from the enrolments page
    Given today is "10-02-2014"
    Given I am on the enrolments page for "Exp. Canina de Cieza"
    And I press "Enroll a new dog"

    When I select "Snoopy" from "Dog"
    And I select "Champion" from "Class"
    And I check "Partner"
    When I press "Create Enrolment"
    Then I should see "Price:" and "24.00"
    When I press "Create Enrolment"
    Then "Snoopy" should be enrolled for "Exp. Canina de Cieza"
    And I should be on the enrolments page for "Exp. Canina de Cieza"
    And I should see "Inscription has been created"
    And I should see "Snoopy" and "Champion"
    And I should see "24.00"
    And I should see "TOTAL" and "24.00"

  @done
  Scenario: Try to enroll 2 times for the same dog in the same exhibition is bad
    Given I have "Snoopy" enrolled in "Exp. Canina de Cieza" in "Champion" class on "10-02-2014"
    Given today is "10-02-2014"
    And I press "Enroll a new dog"

    When I select "Snoopy" from "Dog"
    And I select "Open" from "Class"
    And I check "Partner"
    When I press "Create Enrolment"
    Then I should see "Inscription has not been created"
    And I should see "Your dog has already been enrolled in this exhibition"

  @done
  Scenario: Enroll 2 times for the same dog in different exhibitions is allowed
    And I have "Snoopy" enrolled in "Exp. Canina de Cieza" in "Champion" class on "10-02-2014"
    Given today is "10-02-2014"
    Given I am on the exhibitions page
    And I follow "Amsterdam Winner Show"
    And I press "Enroll a new dog"

    When I select "Snoopy" from "Dog"
    And I select "Open" from "Class"
    And I check "Partner"
    When I press "Create Enrolment"
    Then I should see "Price:" and "24.00"

    When I press "Create Enrolment"
    Then "Snoopy" should be enrolled for "Amsterdam Winner Show"
    And I should be on the enrolments page for "Amsterdam Winner Show"
    And I should see "Inscription has been created"
    And I should see "Snoopy" and "Open"
    And I should see "24.00"
    And I should see "TOTAL" and "24.00"

  @done
  Scenario: Not to select a dog that I want to enroll is bad
    Given today is "10-02-2014"
    And I press "Enroll a new dog"
    Given I select "Select the dog..." from "Dog"
    When I press "Create Enrolment"
    Then I should see "Inscription has not been created"
    And I should see "You have to select a dog"
    And "your dog" should not be enrolled for "Exp. Canina de Cieza"

  @done
  Scenario: 'Couple', 'Working' and 'Group Breeding' are not available classes
    Given today is "10-02-2014"
    And I press "Enroll a new dog"

    Given I select "Snoopy" from "Dog"
    And I select "Couple" from "Class"
    And I check "Partner"
    When I press "Create Enrolment"
    Then I should see "This class cant be selected for now. Please contact with the Webmaster"

  @done
  Scenario: Class selected must be correct for your dog
    Given today is "10-02-2014"
    And I press "Enroll a new dog"

    When I select "Snoopy" from "Dog"
    And I select "Puppy" from "Class"
    When I press "Create Enrolment"
    Then I should see "Inscription has not been created"
    And I should see "Must select a class or your dog is not accepted for this class"
    And "Snoopy" should not be enrolled for "Exp. Canina de Cieza"

  @done
  Scenario: Try to enrol a dog out of time is bad
    Given today is "12-12-2013"
    And I am on the exhibition page for "Exp. Canina de Cieza"
    When I press "Enroll a new dog"
    Then I should see "This exhibition is not available to enroll at the moment."
    And "Snoopy" should not be enrolled for "Exp. Canina de Cieza"
    And I should be on the exhibition page for "Exp. Canina de Cieza"

  @done
  Scenario: Try to enrol a dog when no prices have been set for this is bad
    Given today is "12-12-2013"
    And the exhibition "TWK 139th Dog Show" exists
    And there are no prices set for "TWK 139th Dog Show"
    And I am on the exhibition page for "Exp. Canina de Cieza"
    When I press "Enroll a new dog"
    Then I should see "This exhibition is not available to enroll at the moment."
    And "Snoopy" should not be enrolled for "Exp. Canina de Cieza"
    And I should be on the exhibition page for "Exp. Canina de Cieza"
