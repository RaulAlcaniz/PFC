Feature: Editing People
  In order to update person information
  As a user
  I want to be able to do that through an interface

  Background:
    Given there is a person called "Personal Name"
    And I am on the person page for "Personal Name"
    When I follow "Edit person"

  @done
  Scenario: Updating a person
    When I fill in "Name" with "Personal Name beta"
    And I select "1990 January 16" as the person "date_of_birth"
    And I select "Female" from "Sex"
    And I select "Germany" from "Country"
    And I press "Update Person"
    Then I should see "Person has been updated."
    And I should be on the person page for "Personal Name beta"

  @done
  Scenario: Updating a person with a name already taken is bad
    Given there is a person called "Personal Name beta"
    When I fill in "Name" with "Personal Name beta"
    And I press "Update Person"
    Then I should see "Person has not been updated."
    And I should see "Name has already been taken"

  # When we are editing a person, we can't select nil value
  # for sex or country because we use prompt tag, so isn't necessary test it