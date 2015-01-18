Feature: Signing in
  I order to use the site
  As a user
  I want to be able to sign in

  @done
  Scenario: No signing in via confirmation
    Given there are the following users:
      | email            | password | unconfirmed |
      | user@example.com | password | true        |
    When "user@example.com" opens the email with subject "Confirmation instructions"
    And they click the first link in the email
    Then I should see "Your account was successfully confirmed"
    Then I should not see "Signed in as user@example.com"

  @done
  Scenario: Signing in via form
    Given there are the following users:
      | email            | password |
      | user@example.com | password |
    And I am signed in as them
    Then I should see "Signed in successfully"
    And I should see "Signed in as user@example.com"

  @done
  Scenario: Trying to access to an area that requires authentication
    Given there are the following users:
      | email            | password |
      | user@example.com | password |

    Given I am not signed in as them
    When I go to the profile for "user@example.com"

    And I should see "You need to sign in or sign up before continuing."