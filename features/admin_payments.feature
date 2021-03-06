@time_travel
Feature: Admin payments
  In order to manage payments
  As a admin
  I want to be able to manage payments when I'm admin

  Background:
    Given today is "10-12-2013"
    Given there are the following users:
      | email              | password | admin  |
      | admin@testing.com  | password | true   |
      | user@testing.com   | password | false  |
      | user2@testing.com  | password | false  |

    Given "user@testing.com" is owner for some dogs:
      | Name   | Date of birth | Sire    | Dam   | Sex  | Titles                    |
      | Snoopy | 12/12/2012    | Rex     | Missy | Male | PORTO WINNER Jr.          |
      | Dundee | 25/10/2012    | Arthur  | Adele | Male | CRUFTS QUALIFICATION, CH. |
    And "user2@testing.com" is owner for some dogs:
      | Name | Date of birth | Sire    | Dam   | Sex  | Titles           |
      | Iris | 12/12/2012    | Rex     | Missy | Male | PORTO WINNER Jr. |

    Given the exhibition "Exp. Canina de Cieza" exists
    And the exhibition "TWK 139th Dog Show" exists

    Given "user@testing.com" has "Snoopy" enrolled in "Exp. Canina de Cieza"
    And "user@testing.com" has "Dundee" enrolled in "Exp. Canina de Cieza"
    And the payment of "Snoopy" for "Champion" class is sending and "unverified"
    And the payment of "Dundee" for "Champion" class is not sending

    Given "user2@testing.com" has "Iris" enrolled in "TWK 139th Dog Show"
    And the payment of "Iris" for "Champion" class is sending and "unverified"

    Given I am signed in as "admin@testing.com"

  @done
  Scenario: Viewing payments page for an user being admin
    Given I am on the person page for "user@testing.com"
    When I follow "View payments"
    Then I should be on the payments page for "user@testing.com"
    And the payments page should content:
    |Identifier|Exhibition          |Amount|Last modification|Status    |Payment deadline|See | Edit |
    |1         |Exp. Canina de Cieza|24.00 |02/10/2014       |unverified|Open            |View| Edit |

  @done
  Scenario: Viewing all payments in the system
    Given I am on the payments page
    Then the payments page should content:
      |Identifier|Exhibition          |Amount|Last modification|Status    |Payment deadline|See | Edit |
      |1         |Exp. Canina de Cieza|24.00 |02/10/2014       |unverified|Open            |View| Edit |
      |2         |TWK 139th Dog Show  |24.00 |02/10/2014       |unverified|Open            |View| Edit |

  @done
  Scenario: Viewing payments from the payments page for an user
    Given I am on the payments page for "user@testing.com"
    And I follow "View"
    Then I should be on the payment page for "Snoopy"

  @done
  Scenario: Editing payments from the payments page for an user
    Given I am on the payments page for "user@testing.com"
    And I follow "Edit"
    Then I should see "All right? Select the status for the payment"
    And the select "Status" should have following options:
      | accepted   |
      | rejected   |
      | unverified |

    When I select "accepted" from "Status"
    And I press "Update Payment"
    Then I should be on the admin enrolments page for "Exp. Canina de Cieza" for "user@testing.com"
    And I should see "Accepted"

  @done
  Scenario: Administering payments from the user page
    Given I am on the person page for "user@testing.com"
    When I follow "View enrolments"
    Then I should be on the admin exhibitions page for "user@testing.com"
    And I should see "View enrolments"

    Given I follow "View enrolments" for "Exp. Canina de Cieza"
    Then I should be on the admin enrolments page for "Exp. Canina de Cieza" for "user@testing.com"

    When I follow "See Payment" for the dog "Snoopy"
    Then I should be on the payment page for "Snoopy"
    When I follow "Edit Payment"

    Then I should see "All right? Select the status for the payment"
    And the select "Status" should have following options:
      | accepted   |
      | rejected   |
      | unverified |

    When I select "accepted" from "Status"
    And I press "Update Payment"

    Then I should be on the admin enrolments page for "Exp. Canina de Cieza" for "user@testing.com"
    And I should see "Accepted"