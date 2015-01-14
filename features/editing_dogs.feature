Feature: Editing Dogs
  In order to update dog information
  As a user
  I want to be able to do that through an interface

  Background:
    Given there are the following users:
      | email             | password |
      | user@testing.com  | password |
    And I am signed in as "user@testing.com"
    And I am on my profile page
    Given there are some breeds ordered by name:
      | Name              |
      | Australian Kelpie |
      | Dachshund         |
      | Akita             |

    And there are varieties for the breed "Dachshund":
      | Name              |
      | Miniature         |
      | Standard          |
    And there are subvarities for the variety "Miniature":
      | Name          |
      | Long-haired   |
      | Smooth-haired |
      | Wire-haired   |

    Given "user@testing.com" is owner for some dogs:
      | Name       | Date of birth | Sire | Dam   | Sex    | Titles           |
      | Snoopy     | 07/05/2010    | Rex  | Missy | Male   | PORTO WINNER Jr. |
      | Scooby Doo | 27/01/2008    | Skip | Peggy | Male   | GRAN CH MOLDAVIA |
      | Lassie     | 02/02/2008    | Rolf | Linda | Female |                  |
    And "Snoopy" breed is "Australian Kelpie"
    And "Lassie" breed is "Australian Kelpie" with "Standard" variety
    And "Scooby Doo" breed is "Dachshund" with "Miniature" variety and "Long-haired" subvariety

  @done
  Scenario: Updating a dog
    Given I am on the dog page for "Snoopy"
    When I follow "Edit Dog"
    And I fill in "Name" with "Poppy"
    And I fill in "Sire" with "Rin Tin Tin"
    And I fill in "Dam" with "Laika"
    And I select "Female" from "Sex"
    And I select "May 7, 2012" as the dog "date_of_birth"
    And I select "Akita" from "breed"
    And I fill in "Titles" with "PORTO WINNER Jr. 2011"

    And I press "Update Dog"
    Then I should be on the dog page for "Poppy"
    And I should see "Dog has been updated"

  @done
  Scenario: Updating a dog whose new breed has not varieties
    Given I am on the dog page for "Scooby Doo"
    When I follow "Edit Dog"
    And I select "Australian Kelpie" from "breed"

    And I press "Update Dog"
    Then I should be on the dog page for "Scooby Doo"
    And I should see "Dog has been updated"

  @done
  Scenario: Updating a dog whose breed has variety and the new breed has not varieties
    Given I am on the dog page for "Lassie"
    When I follow "Edit Dog"
    And I select "Australian Kelpie" from "breed"

    And I press "Update Dog"
    Then I should be on the dog page for "Lassie"
    And I should see "Dog has been updated"

  @done
  Scenario: Updating a dog whose new breed has varieties and subvarieties
    Given I am on the dog page for "Snoopy"
    When I follow "Edit Dog"
    And I select "Dachshund" from "breed"

    And I press "Update Dog"

    Then I should see "Select the variety."
    And the select "variety" should have following options:
      | Select variety... |
      | Miniature         |
      | Standard          |
    And I select "Miniature" from "variety"
    And I press "Update Dog"

    Then I should see "Select the subvariety."
    And the select "subvariety" should have following options:
      | Select subvariety... |
      | Long-haired          |
      | Smooth-haired        |
      | Wire-haired          |

    When I select "Long-haired" from "subvariety"

    And I press "Update Dog"
    Then I should be on the dog page for "Snoopy"
    And I should see "Dog has been updated"


  @done
  Scenario: Updating a dog without a name is bad
    Given I am on the dog page for "Snoopy"
    When I follow "Edit Dog"
    And I fill in "Name" with ""
    And I press "Update Dog"
    Then I should see "Dog has not been updated."
    And I should see "Name can't be blank"
