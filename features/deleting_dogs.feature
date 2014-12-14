Feature: Deleting dogs
  In order to remove dogs
  As user
  I want to make it disappear

  Background:
    Given "user@testing.com" is an owner for a dog which name is "Iris"
    Given "user@testing.com" is an owner for a dog which name is "Sena"
    And I am on the dog page for "Iris"

  @done
  Scenario: Deleting dogs
    When I follow "Delete Dog"
    Then I should see "Dog has been deleted."
    And I should be on the dogs page for "user@testing.com"
    And I should not see "Iris"
    But I should see "Sena"