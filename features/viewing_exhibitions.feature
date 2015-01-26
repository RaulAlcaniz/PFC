Feature: Viewing exhibitions
  In order to view exhibitions
  As a user
  I want to see them on the exhibitions page

  Background:
  There are exhibitions with name, description, and dates for start/end
    Given there are exhibitions with these entries:
      | Name                | Description     | Start date          | End date            |
      | TWK 139th Dog Show  | Not description | May 7, 2015 - 12:30 | May 7, 2015 - 20:30 |
      | 9th Annual Dog Show | www.example.org | Sep 1, 2015 - 17:00 | Sep 3, 2015 - 20:00 |

  @done
  Scenario: View all exhibitions
    When the exhibitions page is visited
    Then the exhibitions page should content:
      | Name                                             | Start date  | End date    |
      | TWK 139th Dog Show Description: Not description  | May 7, 2015 | May 7, 2015 |
      | 9th Annual Dog Show Description: www.example.org | Sep 1, 2015 | Sep 3, 2015 |

  @done
  Scenario: Viewing information for a exhibition
    When the exhibitions page is visited
    And I follow "TWK 139th Dog Show"
    Then I should be on the exhibition page for "TWK 139th Dog Show"
    And I should see "TWK 139th Dog Show"
    And I should see "Start date" and "May 7, 2015 - 12:30"
    And I should see "End date" and "May 7, 2015 - 20:30"
    And I should see "Not description"