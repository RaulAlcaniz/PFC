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
    And I fill in "Date of birth" with "2/02/2002"
    #And I select "1990 January 16" as the "Date of birth" date
    And I select "Female" from "Sex"
    And I select "Germany" from "Country"
    And I press "Update Person"
    Then I should see "Person has been updated."
    And I should be on the person page for "Personal Name beta"

  @done
  Scenario: Updating a person with a name already taken
    Given there is a person called "Personal Name beta"
    When I fill in "Name" with "Personal Name beta"
    And I press "Update Person"
    Then I should see "Person has not been updated."
    And I should see "Name has already been taken"

  @done
  Scenario: Updating a person without a date of birth
    When I fill in "Date of birth" with ""
    And I press "Update Person"
    Then I should see "Person has not been updated."
    And I should see "Date of birth can't be blank"

  # In the edit form can't be selected nil value for sex or country because
  # prompt use, so isn't necessary test it