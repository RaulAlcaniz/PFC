Feature: Viewing people
  In order to view people
  As a user
  I want to see them on the people page when I'm an admin

  Background:
    Given there are the following users:
      | email              | password | admin  |
      | admin@testing.com  | password | true   |
      | user@testing.com   | password | false  |
    And I am signed in as "admin@testing.com"

    Given there are people with these entries:
      | Name     |Date of birth | Sex    | Country |
      | Gamoneda |30/05/1930    | Male   | Spain   |
      | Morrison |18/02/1931    | Male   | U.S.A   |
      | Allende  |02/08/1942    | Female | Chile   |

    And I am on the people page

  @done
  Scenario: An admin wants see what people are in the system
    When the people page is visited
    Then people page should content:
      | Name              |Date of birth | Sex          | Country      |
      | admin@testing.com | 01/01/2000   | Not selected | Not selected |
      | user@testing.com  | 01/01/2000   | Not selected | Not selected |
      | Gamoneda          | 30/05/1930   | Male         | Spain        |
      | Morrison          | 18/02/1931   | Male         | U.S.A        |
      | Allende           | 02/08/1942   | Female       | Chile        |

  @done
  Scenario: An admin wants see one person information
    When the people page is visited
    And I follow "Gamoneda"
    Then I should be on the person page for "Gamoneda"
    And I should see "Gamoneda" within "#people h4"