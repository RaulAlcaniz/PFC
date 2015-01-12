Feature: Creating people
  In order to create people
  As a user
  I want to create them easily

  Background:
    Given I am on the people page
    And I follow "New Person"
    Then the select "Sex" should have following options:
      |Select one...|
      |Male         |
      |Female       |
#    And the select "Country" should have following options:
 #     |Choose one...|
  #    |Afghanistan|
   #   |Albania|
    #  |Algeria|
  # Se listan TODOS los paises, cómo podría seleccionar solo unos cuántos?

  @done
  Scenario: Creating a person
    When I fill in "Name" with "Personal name"
    And I select "May 16, 2000" as the person "date_of_birth"
    And I select "Male" from "Sex"
    And I select "Spain" from "Country"
    And I press "Create Person"
    Then I should see "Person has been created."
    And I should be on the person page for "Personal name"

  @done
  Scenario: Creating a person without a name is bad
    When I fill in "Name" with ""
    And I press "Create Person"
    Then I should see "Person has not been created."
    And I should see "Name can't be blank"

  @done
  Scenario: Creating a person with a name already taken is bad
    Given there is a person called "Personal Name"
    When I fill in "Name" with "Personal name"
    And I press "Create Person"
    Then I should see "Person has not been created."
    And I should see "Name has already been taken"

  @done
  Scenario: Creating a person with an invalid sex is bad
    When I select "Select one..." from "Sex"
    And I press "Create Person"
    Then I should see "Person has not been created."
    And I should see "Sex can't be blank"

  @done
  Scenario: Creating a person with an invalid country is bad
    When I select "Choose one..." from "Country"
    And I press "Create Person"
    Then I should see "Person has not been created."
    And I should see "Country can't be blank"