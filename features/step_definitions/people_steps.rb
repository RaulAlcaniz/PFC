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
  expected_table.diff!(actual_table)
end