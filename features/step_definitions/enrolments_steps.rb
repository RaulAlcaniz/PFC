Then(/^"(.*?)" should( not)? be enrolled for "(.*?)"$/) do |dog_name, negate, exhibition_name|
  if negate
    Enrolment.count.should eq 0
  else
    @enrolment = Enrolment.find_by(dog_id: Dog.find_by(name: "#{dog_name}").id,
                                   exhibition_id: Exhibition.find_by(name: "#{exhibition_name}").id)
    @enrolment.should_not be_nil
  end
end

When(/^I follow "(.*?)" for "(.*?)" enrolled in "(.*?)" class$/) do |action, dog_name, dog_class|

  enrol_id = Enrolment.find_by(dog_id: Dog.find_by_name("#{dog_name}").id, dog_class: dog_class).id
  exhib_id = (Exhibition.find_by_name 'Exp. Canina de Cieza').id

  page.all('a', text: "#{action}").each do |link|
    link.click if link[:href] == "/exhibitions/#{exhib_id}/enrolments/#{enrol_id}"
  end

end

Given(/^I have "(.*?)" enrolled( unpartnered)? in "(.*?)" in "(.*?)" class on "(.*?)"$/) do |dog_name, nopartner, exhibition_name, dog_class, date|
  steps %{
    Given I am on the exhibitions page
    And I follow "#{exhibition_name}"
    Given today is "#{date}"
    And I press "Enroll a new dog"
    When I select "#{dog_name}" from "enrolment_dog_id"
    And I select "#{dog_class}" from "enrolment_dog_class"
    }
    step 'I check "Partner"' if !nopartner
  steps %{
    When I press "Create Enrolment"
    And I press "Create Enrolment"
    Then "#{dog_name}" should be enrolled for "#{exhibition_name}"
    Given I am on the exhibitions page
    And I follow "#{exhibition_name}"
    }
end

Then(/^I should see "(.*?)" for the payment of "(.*?)"$/) do |text, dog_names|
  flag = false
  dog_names.gsub(/and/,',').split(',').each do |dog_name|
    Enrolment.where(dog_id: Dog.find_by_name("#{dog_name.strip}").id).each do |enrolment|
      if Enrolment.where(payment_id: enrolment.id).count  == dog_names.gsub(/and/,',').split(',').count
        page.all('a', text: "#{text}").each do |link|
          flag = true if link[:href] == "/payments/#{enrolment.payment_id}?exhibition_id=#{enrolment.exhibition_id}"
        end
      end
    end
  end
  flag.should be true
end

Then(/^I should see "(.*?)" button$/) do |name|
  find_button(name).should_not be_nil
end

Given(/^the exhibition "(.*?)" has already finished$/) do |exhibition|
  (Exhibition.find_by_name exhibition).end_date.should < Date.today
end

Then(/^the last deadline ended for "(.*?)"$/) do |exhibition|
  JSON.parse((Exhibition.find_by_name exhibition).tax)['deadlines'].last['end_date'].should < Date.today.strftime('%d/%m/%Y')
end

When(/^I try to "(.*?)" the enrolments for "(.*?)" in "(.*?)"$/) do |action, user, exhibition|
  case action
    when 'view'
      visit ("people/#{Person.find_by_name(user).id}/exhibitions/#{Exhibition.find_by_name(exhibition).id}/enrolments")
    when 'create'
      visit ("people/#{Person.find_by_name(user).id}/exhibitions/#{Exhibition.find_by_name(exhibition).id}/enrolments/new")
  end
end

When(/^I try to access to a user enrolments page "(.*?)" as admin$/) do |exhibition|
  visit ("/exhibitions/#{Exhibition.find_by_name(exhibition).id}/enrolments")
end

Given(/^there are sent erroneous payments data for "(.*?)"$/) do |exhibition|
  step "there are these payments for \"partners\" in \"#{exhibition}\":", table(%{
    | Class           | Dogs              | 1st entry deadline |
    | J. I. O. W. CH. | 1st dog           | 24.00              |
  })
end