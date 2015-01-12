@time_travel
Feature: Editing exhibitions
  In order to update a exhibition information
  As a user
  I want to be able to do that through an interface


  Background:
    There are exhibitions with name, description, and dates for start/end
    Given today is "April 7, 2014"
    Given there are exhibitions with these entries:
      | Name                | Description     | Start date          | End date            |
      | TWK 139th Dog Show  | Not description | May 7, 2014 - 12:30 | May 7, 2014 - 20:30 |
      | 9th Annual Dog Show | www.example.org | Sep 1, 2014 - 17:00 | Sep 3, 2014 - 20:00 |

    Given I am on the exhibition page for "TWK 139th Dog Show"
    And I follow "Edit exhibition"

  @done
  Scenario: Updating a exhibition
    When I fill in "Name" with "WK 145th Dog Show"
    And I fill in "Description" with "www.moreinfo.org for more information"
    And I select "May 27, 2014 - 12:30" as the exhibition "start_date"
    And I select "May 27, 2014 - 20:30" as the exhibition "end_date"
    And I press "Update Exhibition"

    Then I should be on the exhibition page for "WK 145th Dog Show"
    And I should see "Exhibition has been updated."

  @done
  Scenario: Update exhibitions without a name is bad
    When I fill in "Name" with ""
    And I press "Update Exhibition"
    Then I should see "Exhibition has not been updated."
    And I should see "Name can't be blank"

  @done
  Scenario: Update exhibitions with a start date before today is bad
    When I select "Jan 1, 2014" as the exhibition "start_date"
    And I press "Update Exhibition"
    Then I should see "Exhibition has not been updated."
    And I should see "Start date must be after today"

  @done
  Scenario: Update exhibitions with a end date before today is bad
    When I select "Jan 1, 2014" as the exhibition "end_date"
    And I press "Update Exhibition"
    Then I should see "Exhibition has not been updated."
    And I should see "End date must be after today"

  @done
  Scenario: Start date must be before to the end date
    When I select "Dec 7, 2016" as the exhibition "start_date"
    And I select "Dec 1, 2015" as the exhibition "end_date"
    And I press "Update Exhibition"
    Then I should see "Exhibition has not been updated."
    And I should see "End date must be after to the start date"
