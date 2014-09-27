Feature: Creating exhibitions
  In order to create exhibitions
  As a user
  I want to create them easily

  Background:
    Given there are the following users:
      | email             | password |
      | user@testing.com  | password |
    And I am signed in as "user@testing.com"

    Given I am on the exhibitions page
    And I follow "New Exhibition"

  @done
  Scenario: Creating exhibitions
    When I fill in "Name" with "The Westminster Kennel Club 139th Annual Dog Show"
    And I fill in "Description" with "More info: www.example.org"
    And I select "a date after today" as the exhibition "start_date"
    And I select "a date after today" as the exhibition "end_date"
    And I press "Create Exhibition"
    Then I should be on the exhibition page for "The Westminster Kennel Club 139th Annual Dog Show"
    And I should see "Exhibition has been created"

  @done
  Scenario: Create exhibitions without a name is not permitted
    When I fill in "Name" with ""
    And I press "Create Exhibition"
    Then I should see "Exhibition has not been created."
    And I should see "Name can't be blank"

  @done
  Scenario: Create exhibitions with a start date before today is not permitted
    When I fill in "Name" with "The Westminster Kennel Club 139th Annual Dog Show"
    And I select "a date before today" as the exhibition "start_date"
    And I press "Create Exhibition"
    Then I should see "Exhibition has not been created."
    And I should see "Start date must be after today"

  @done
  Scenario: Create exhibitions with a end date before today is not permitted
    When I fill in "Name" with "The Westminster Kennel Club 139th Annual Dog Show"
    And I select "a date before today" as the exhibition "end_date"
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