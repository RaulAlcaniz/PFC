Feature: Signing up
  In order to be attributed for my work
  As a user
  I want to be able to sign up

  @done
  Scenario: Signing up
    Given I am on the homepage
    When I follow "Sign up"
    And I fill in "Email" with "user@example.com"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password"
    And I press "Sign up"
    Then I should see "A message with a confirmation link has been sent to your email address"
    And should be created a person called "user@example.com"
    And "date_of_birth" should be "2000-01-01"
    And "sex" should be "Not selected"
    And "country" should be "Not selected"

  @done
  Scenario: Signing up with an email already taken
    Given there are the following users:
      | email            | password |
      | user@example.com | password |
    When I am on the homepage
    And I follow "Sign up"
    And I fill in "Email" with "user@example.com"
    And I press "Sign up"
    Then I should see "Email has already been taken"
