Feature: Security for dogs
  In order to protect dogs information
  As a no admin user
  I should not be able to change dogs information if I'm not the owner

  Background:
    Given there are the following users:
      | email              | password | admin  |
      | admin@testing.com  | password | true   |
      | user@testing.com   | password | false  |
      | bad@testing.com    | password | false  |

    Given there are some breeds ordered by name:
      | Name              |
      | Australian Kelpie |

    Given "user@testing.com" is an owner for a dog which name is "Iris"

  @done
  Scenario: Trying to see a dog of another user when I'm not an admin is bad
    Given I am signed in as "bad@testing.com"
    When I try to "view" "Iris" for "user@testing.com"

    Then I should be redirected to the home page
    And I should see "You can't access to this page."

  @done
  Scenario: Trying to create a dog to another user when I'm not an admin is bad
    Given I am signed in as "bad@testing.com"
    When I try to "add" "a dog" for "user@testing.com"

    Then I should be redirected to the home page
    And I should see "You can't access to this page."

  @done
  Scenario: Trying to delete a dog to another user when I'm not an admin is bad
    Given I am signed in as "bad@testing.com"
    When I try to "delete" "Iris" for "user@testing.com"

    Then I should be redirected to the home page
    And I should see "You can't access to this page."

  @done
  Scenario: Trying to update a dog to another user when I'm not an admin is bad
    Given I am signed in as "bad@testing.com"
    When I try to "update" "Iris" for "user@testing.com"

    Then I should be redirected to the home page
    And I should see "You can't access to this page."

  @done
  Scenario: Admin can modify any information on dogs for any user
    Given I am signed in as "admin@testing.com"

    Given I am on the person page for "user@testing.com"
    When I follow "Add a dog"
    When I fill in "Name" with "Snoopy"
    And I select "May 7, 2010" as the dog "date_of_birth"
    And I select "Australian Kelpie" from "breed"
    And I press "Create Dog"
    Then I should be on the dog page for "Snoopy"
    And I should see "Dog has been created"
    And I should not see "You can't access to this page."

    Given I am on the dog page for "Iris"
    When I follow "Edit Dog"
    And I fill in "Name" with "Poppy"
    And I press "Update Dog"
    Then I should be on the dog page for "Poppy"
    And I should see "Dog has been updated"
    Then I should not see "You can't access to this page."

    Given I am on the dog page for "Snoopy"
    When I follow "Delete Dog"
    Then I should see "Dog has been deleted."





