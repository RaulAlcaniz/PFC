Feature: Creating people
  In order to create people
  As a user
  I want to create them easily

  Background:
    Given I am on the home page
    And I follow "New Person"
    Given the select "Date of birth" has following options:
      | January 15, 1990 |
      | January 16, 1990 |
      | January 17, 1990 |
    # Cómo puedo hacer el select del Date of birth?
    And the select "Sex" should have following options:
      |Choose one...|
      |Male         |
      |Female       |
#    And the select "Country" should have following options:
 #     |Choose one...|
  #    |Afghanistan|
   #   |Albania|
    #  |Algeria|
  # Se listan TODOS los paises, cómo podría seleccionar solo unos cuántos?

  @actual
  Scenario: Creating a person
    When I fill in "Name" with "Personal name"
    And I select "1990 January 16" as the "Date of birth" date
    And I select "Male" from "Sex"
    And I select "Spain" from "Country"
    And I press "Create Person"
    Then I should see "Person has been created."
    And I should be on the person's page for "Personal name"

  @pending
  Scenario: Creating a person with a name already taken
    Given there is a person called "Personal name"
    When I fill in "Name" with "Personal name"
    And I press "Create Person"
    Then I should see "Person has not been created."
    And I should see "Name already taken."
    #And I should be on the person's page for "Personal name"