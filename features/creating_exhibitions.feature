@time_travel
Feature: Creating exhibitions
  In order to create exhibitions
  As a user
  I want to create them easily when I'm an admin

  Background:
    Given there are the following users:
      | email              | password | admin  |
      | admin@testing.com  | password | true   |
      | user@testing.com   | password | false  |
    And I am signed in as "admin@testing.com"

    Given I am on the exhibitions page
    Given today is "April 15, 2014"
    And I follow "New Exhibition"

  @done
  Scenario: Creating exhibitions
    When I fill in "Name" with "The Westminster Kennel Club 139th Annual Dog Show"
    And I fill in "Description" with "More info: www.example.org"
    And I select "July 1, 2014 - 12:30" as the exhibition "start_date"
    And I select "July 5, 2014" as the exhibition "end_date"
    And I press "Create Exhibition"
    Then I should see "Exhibition has been created"
    And I should be on the exhibition page for "The Westminster Kennel Club 139th Annual Dog Show"

    And I should see "No payment list available at the moment."

  @done
  Scenario: Create exhibitions without a name is bad
    When I fill in "Name" with ""
    And I press "Create Exhibition"
    Then I should see "Exhibition has not been created."
    And I should see "Name can't be blank"

  @done
  Scenario: Create exhibitions with a start date before today is bad
    When I fill in "Name" with "The Westminster Kennel Club 139th Annual Dog Show"
    And I select "April 10, 2014" as the exhibition "start_date"
    And I press "Create Exhibition"
    Then I should see "Exhibition has not been created."
    And I should see "Start date must be after today"

  @done
  Scenario: Create exhibitions with a end date before today is bad
    When I fill in "Name" with "The Westminster Kennel Club 139th Annual Dog Show"
    And I select "April 10, 2014" as the exhibition "end_date"
    And I press "Create Exhibition"
    Then I should see "Exhibition has not been created."
    And I should see "End date must be after today"

  @done
  Scenario: Start date must be before to the end date
    When I fill in "Name" with "The Westminster Kennel Club 139th Annual Dog Show"
    And I select "May 7, 2016 - 12:30" as the exhibition "start_date"
    And I select "Jan 1, 2014 - 20:30" as the exhibition "end_date"
    And I press "Create Exhibition"
    Then I should see "Exhibition has not been created."
    And I should see "End date must be after to the start date"
