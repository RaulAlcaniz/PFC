Feature: Creating dogs
  In order to create a dog for some user
  As a user
  I want to create them easily

  Background:
    Given there are the following users:
      | email             | password |
      | user@testing.com  | password |
    And I am signed in as "user@testing.com"
    And I am on the person page for "user@testing.com"
    Given there are some breeds ordered by name:
      | Name              |
      | Australian Kelpie |
      | Dachshund         |

    Given there are varieties for the breed "Dachshund":
      | Name              |
      | Miniature         |
      | Standard          |
    And there are subvarities for the variety "Standard":
      | Name          |
      | Long-haired   |
      | Smooth-haired |
      | Wire-haired   |
    When I follow "Add a dog"

    Then the select "breed" should have following options:
      | Select breed...   |
      | Australian Kelpie |
      | Dachshund         |

    #Then "Australian Kelpie" should be an option for "breed"
    #Then "Mudi" should be an option for "breed"
    #Then "Dachshund" should be an option for "breed"

  @done
  Scenario: Creating dogs which breed has not varieties
    When I fill in "Name" with "Snoopy"
    #And I fill in "Breeder" with "Name 1"
    And I fill in "Sire" with "Rex"
    And I fill in "Dam" with "Missy"
    And I select "Male" from "Sex"
    And I select "May 7, 2010" as the dog "date_of_birth"
    And I select "Australian Kelpie" from "breed"
    #And I select Land of Birth "Spain"
    And I fill in "Titles" with "PORTO WINNER Jr. 2011"
    And I press "Create Dog"
    Then I should be on the dog page for "Snoopy"
    And I should see "Dog has been created"

  @done
  Scenario: Creating dogs which breeds have varieties but not subvarieties
    When I fill in "Name" with "Scooby Doo"
    And I fill in "Sire" with "Skip"
    And I fill in "Dam" with "Peggy"
    And I select "Male" from "Sex"
    And I select "January 27, 2008" as the dog "date_of_birth"
    And I select "Dachshund" from "breed"
    #And I select Land of Birth "Spain"
    And I fill in "Titles" with "GRAN CH MOLDAVIA"
    And I press "Create Dog"

    Then I should see "Select the variety."
    And the select "variety" should have following options:
      | Select variety... |
      | Miniature         |
      | Standard          |
    When I select "Miniature" from "variety"

    And I press "Create Dog"
    Then I should be on the dog page for "Scooby Doo"
    And I should see "Dog has been created"


  @done
  Scenario: Creating dogs which breed has varieties and subvarieties
    When I fill in "Name" with "Rex"
    And I fill in "Sire" with "Toto"
    And I fill in "Dam" with "Laika"
    And I select "Male" from "Sex"
    And I select "May 11, 2005" as the dog "date_of_birth"
    And I select "Dachshund" from "breed"
    #And I select Land of Birth "Spain"
    And I fill in "Titles" with "Ch. CHIPRE, Ch. MOLDAVIA"
    And I press "Create Dog"

    Then I should see "Select the variety."
    And the select "variety" should have following options:
      | Select variety... |
      | Miniature         |
      | Standard          |
    And I select "Standard" from "variety"
    And I press "Create Dog"

    Then I should see "Select the subvariety."
    And the select "subvariety" should have following options:
      | Select subvariety... |
      | Long-haired          |
      | Smooth-haired        |
      | Wire-haired          |

    When I select "Long-haired" from "subvariety"
    And I press "Create Dog"
    Then I should be on the dog page for "Rex"
    And I should see "Dog has been created"

  @done
  Scenario: Creating a dog without a name
    When I fill in "Name" with ""
    And I press "Create Dog"
    Then I should see "Dog has not been created."
    And I should see "Name can't be blank"
