Feature: Creating dogs
  In order to create a dog for some user
  As a user
  I want to create them easily

  Background:
    Given there are the following users:
      | email             | password |
      | user@testing.com  | password |
    And I am signed in as them
    And I am on the person page for "user@testing.com"
    When I follow "Add dog"

    @pending
    Scenario: Creating dogs
      When I fill in "Name" with "Dog 1"
      And I fill in "Breeder" with "Name 1"
      And I fill in "Sire" with "Sire 1"
      And I fill in "Dam" with "Dam 1"
      And I select sex "Male"
      And I select "Date of Birth"
      And I select "Breed"
      And I select Land of Birth "Spain"
      And I fill in "Titles" with "Title 1, Title 2"
      And I press "Create Dog"
      Then I should be on the dog page for "Dog 1"
      And I should see "Dog 1 create successfully"
