Given(/^there is a person called "(.*?)"$/) do |name|
  @person = FactoryGirl.create(:person, name: name)
end

Given(/^there are people with these entries:$/) do |table|
  table.map_headers!('Name' => :name, 'Date of birth'=> :date_of_birth,
                     'Sex' => :sex, 'Country' => :country)
  table.hashes.map{|hash| FactoryGirl.create(:person, hash)}
end

When(/^the people page is visited$/) do
  visit 'people'
end

Then(/^people page should content:$/) do |expected_table|
  rows = find('table#people').all('tr')
  actual_table = rows.map{ |row| row.all('th, td').map{ |cell| cell.text} }
  puts actual_table
  expected_table.diff!(actual_table)
end

Then /^the select "([^"]*)" should have at least the following options:$/ do |field, options|
  options = options.transpose.raw
  flag = true
  actual_options = find_field(field).all('option').map { |option| option.text }
  options.first.each do |option|
    flag = false if !actual_options.include? option
  end
  flag.should be true
end

Given(/^I try to access to "(.*?)" page$/) do |route|
  visit "#{route.downcase.split.last.pluralize}/#{route.downcase.split.first}"
end

Given(/^I try to access to the person page for "(.*?)"$/) do |name|
  step "I am on the person page for \"#{name}\""
end




