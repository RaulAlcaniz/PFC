Feature: Viewing dogs
  In order to view dogs
  As a user
  I want to see them on it owner page

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
      | Name       | Date of birth | Sire | Dam   | Sex  | Titles           |
      | Snoopy     | 07/05/2010    | Rex  | Missy | Male | PORTO WINNER Jr. |
      | Scooby Doo | 27/01/2008    | Skip | Peggy | Male | GRAN CH MOLDAVIA |
    And "Snoopy" breed is "Australian Kelpie"
    And "Scooby Doo" breed is "Dachshund" with "Miniature" variety and "Long-haired" subvariety

    When I follow "My dogs"

  @done
  Scenario: Viewing dogs for an user
    Then I should see "Snoopy" within "#dogs"
    And I should see "Scooby Doo" within "#dogs"

  @done
  Scenario: Viewing a dog
    When I follow "Snoopy"
    Then I should be on the dog page for "Snoopy"
    And I should see "Name" and "Snoopy"
    And I should see "Date of birth" and "07/05/2010"
    And I should see "Sire" and "Rex"
    And I should see "Dam" and "Missy"
    And I should see "Breed" and "Australian Kelpie"
    And I should see "Sex" and "Male"
    And I should see "Titles" and "PORTO WINNER Jr."

  @done
  Scenario: Viewing a dog
    When I follow "Scooby Doo"
    Then I should be on the dog page for "Scooby Doo"
    And I should see "Scooby Doo"
    And I should see "Date of birth" and "27/01/2008"
    And I should see "Sire" and "Skip"
    And I should see "Dam" and "Peggy"
    And I should see "Breed" and "Dachshund"
    And I should see "Variety" and "Miniature"
    And I should see "Subvariety" and "Long-haired"
    And I should see "Sex" and "Male"
    And I should see "Titles" and "GRAN CH MOLDAVIA"