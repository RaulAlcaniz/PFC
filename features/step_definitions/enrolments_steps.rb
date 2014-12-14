Then(/^"(.*?)" should( not)? be enrolled for "(.*?)"$/) do |dog_name, negate, exhibition_name|
  if negate
    Enrolment.count.should eq 0
  else
    @enrolment = Enrolment.find_by(dog_id: Dog.find_by(name: "#{dog_name}").id,
                                   exhibition_id: Exhibition.find_by(name: "#{exhibition_name}").id)
    @enrolment.should_not be_nil
  end
end

#When /^as admin I (press|follow|check|uncheck|choose) "([^\"]*)" for (.*) whose (.*) is "([^\"]*)"$/ do |action, whatyouclick, class_name, var_name, value|

When(/^I follow "(.*?)" for "(.*?)" enrolled in "(.*?)" class$/) do |action, dog_name, dog_class|

  enrol_id = Enrolment.find_by(dog_id: Dog.find_by_name("#{dog_name}").id, dog_class: dog_class).id
  exhib_id = (Exhibition.find_by_name 'Exp. Canina de Cieza').id

  page.all('a', text: "#{action}").each do |link|
    link.click if link[:href] == "/exhibitions/#{exhib_id}/enrolments/#{enrol_id}"
  end

end

Given(/^I have "(.*?)" enrolled in "(.*?)" in "(.*?)" class on "(.*?)"$/) do |dog_name, exhibition_name, dog_class, date|
  steps %{
    Given I am on the exhibitions page
    And I follow "#{exhibition_name}"
    And I press "Inscribe a new dog"
    Given today is "#{date}"
    When I select "#{dog_name}" from "enrolment_dog_id"
    And I select "#{dog_class}" from "enrolment_dog_class"
    And I check "Partner"
    When I press "Create Enrolment"
    And I press "Create Enrolment"
    Then "#{dog_name}" should be enrolled for "#{exhibition_name}"
    Given I am on the exhibitions page
    And I follow "#{exhibition_name}"
    And I press "Inscribe a new dog"
  }
end