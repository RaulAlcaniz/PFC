@time_travel
Feature: Editing People
  In order to update person information
  As a user
  I want to be able to do that through an interface when I'm an admin

  Background:
    Given there are the following users:
      | email              | password | admin  |
      | admin@testing.com  | password | true   |
      | user@testing.com   | password | false  |
    And I am signed in as "admin@testing.com"

    Given there is a person called "Dorothy Oz"
    And I am on the person page for "Dorothy Oz"
    When I follow "Edit person"

  @done
  Scenario: Updating a person
    When I fill in "Name" with "Shaggy Doo"
    And I select "1990 January 16" as the person "date_of_birth"
    And I select "Female" from "Sex"
    And I select "Germany" from "Country"
    And I press "Update Person"
    Then I should see "Person has been updated."
    And I should be on the person page for "Shaggy Doo"

  @done
  Scenario: Updating a person without a name is bad
    When I fill in "Name" with ""
    And I press "Update Person"
    Then I should see "Person has not been updated."
    And I should see "Name can't be blank"

  @done
  Scenario: Can't be born in the future
    Given today is "01-01-2015"
    When I select "2015 December 16" as the person "date_of_birth"
    And I press "Update Person"
    Then I should see "Person has not been updated."
    And I should see "Date of birth must be before today"

#  @done
#  Scenario: Updating a person with a name already taken is bad
#    Given there is a person called "Shaggy Doo"
#    When I fill in "Name" with "Shaggy Doo"
#    And I press "Update Person"
#    Then I should see "Person has not been updated."
#    And I should see "Name has already been taken"

  # When we are editing a person, we can't select nil value
  # for sex or country because we use prompt tag, so isn't necessary test it