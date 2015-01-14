@time_travel
Feature: Security for enrolments
  In order to protect enrolments information
  As a no admin user
  I should not be able to change enrolments information if I'm not the owner

  Background:
    Given today is "10-12-2013"
    Given there are the following users:
      | email              | password | admin  |
      | admin@testing.com  | password | true   |
      | user@testing.com   | password | false  |
      | bad@testing.com    | password | false  |

    Given "user@testing.com" is owner for some dogs:
      | Name       | Date of birth | Sire | Dam   | Sex  | Titles           |
      | Snoopy     | 12/12/2012    | Rex  | Missy | Male | PORTO WINNER Jr. |

    Given there are exhibitions with these entries:
      | Name                 | Description     | Start date  | End date    |
      | Exp. Canina de Cieza | www.example.org | Sep 1, 2014 | Sep 3, 2014 |

    Given there are these entry deadlines for "Exp. Canina de Cieza":
      | Name               | Start date | End date   |
      | 1st entry deadline | 08-01-2014 | 22-02-2014 |

    Given there are these payments for "partners" in "Exp. Canina de Cieza":
      | Class           | Dogs              | 1st entry deadline |
      | J. I. O. W. CH. | 1st dog           | 24.00              |
      | J. I. O. W. CH. | 2nd dog           | 19.00              |
      | J. I. O. W. CH. | 3rd and following | 14.00              |

    Given today is "15-03-2014"
    And I am signed in as "user@testing.com"
    Given I have "Snoopy" enrolled in "Exp. Canina de Cieza" in "Champion" class on "10-02-2014"
    And I follow "Sign out"

    @actual
    Scenario: Trying to see an enrolment of another user when I'm not an admin is bad
      Given I am signed in as "bad@testing.com"
      When I try to "view" the enrolments for "user@testing.com" in "Exp. Canina de Cieza"