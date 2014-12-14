Given(/^there are some breeds ordered by name:$/) do |table|
  table.map_headers!('Name' => :name)
  table.hashes.each do |attributes|
    FactoryGirl.create(:breed, attributes)
  end
end

Given(/^"(.*?)" is an owner for a dog which name is "(.*?)"$/) do |owner, name|
  step "there is a person called \"#{owner}\"" unless Person.find_by_name(owner)
  @dog = FactoryGirl.create(:dog, name: name, person_id: @person.id)
end

Given /^today is "([^"]*)"$/ do |date|
  travel_to DateTime.parse(date)
end

After('@time_travel') do
  travel_back
end

When /^I select "([^"]*)" as the (.+) "([^"]*)"$/ do |date, model, selector|
  date = Time.parse(date)

  select(date.year.to_s, :from => "#{model}[#{selector}(1i)]")
  select(date.strftime('%B'), :from => "#{model}[#{selector}(2i)]")
  select(date.day.to_s, :from => "#{model}[#{selector}(3i)]")
  if date.hour != 0
    select(date.strftime('%H'), :from => "#{model}[#{selector}(4i)]")
    select(date.strftime('%M'), :from => "#{model}[#{selector}(5i)]")
  end
end

Given(/^"(.*?)" is owner for some dogs:$/) do |owner, table|
  table.map_headers!('Name' => :name, 'Date of birth'=> :date_of_birth,
                     'Sex' => :sex, 'Sire' => :sire, 'Dam' => :dam,
                     'Titles' => :titles)
  table.hashes.each do |attributes|
    User.find_by_email(owner).person.dogs.create!(attributes)
  end
end

Given(/^"(.*?)" breed is "(.*?)"( with "(.*?)" variety)?( and "(.*?)" subvariety)?$/) do
|name, breed, has_variety, variety_name, has_subvariety, subvariety_name|

  if (has_variety.eql? " with \"#{variety_name}\" variety" or !has_variety) and
      (has_subvariety.eql? " and \"#{subvariety_name}\" subvariety" or !has_subvariety)
    dog = Dog.find_by_name(name)
    dog.dogable = Subvariety.find_by_name(subvariety_name) ||
        Variety.find_by_name(variety_name) ||
        Breed.find_by_name!(breed)
    dog.save!
  end
end

Then(/^I should see "(.*?)" and "(.*?)"$/) do |arg1, arg2|
  steps %Q{
    Then I should see "#{arg1}"
    Then I should see "#{arg2}"
  }
end


#Then /^"([^"]*)" should be an option for "([^"]*)"(?: within "([^\"]*)")?$/ do |value, field, selector|
#  with_scope(selector) do
#    field_labeled(field).first(:xpath, ".//option[text() = '#{value}']").send(:should, be_present)
#  end
#end

#When /^I select "(.*?)" from "(.*?)"$/ do |option, field|
#  page.select option, :from => field
#end


