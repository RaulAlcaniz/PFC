Feature: Signing out
  In order to close my session
  As a user
  I want to be able to sign out

  @done
  Scenario: Signing out
    Given there are the following users:
      | email             | password |
      | user@testing.com  | password |
    And I am signed in as them
    When I follow "Sign out"
    Then I should see "Signed out successfully"
    And I should be on the homepage
    And I should not see "Signed in as user@testing.com"