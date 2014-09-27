Given(/^there are exhibitions with these entries:$/) do |table|
  table.map_headers!('Name' => :name, 'Description'=> :description,
                     'Start date'=> :start_date, 'End date'=> :end_date)
  table.hashes.map{|hash| FactoryGirl.create(:exhibition, hash)}
end

When(/^the exhibitions page is visited$/) do
  visit 'exhibitions'
end

Then(/^the exhibitions page should content:$/) do |expected_table|
  rows = find('table#exhibitions').all('tr')
  actual_table = rows.map{ |row| row.all('th, td').map{ |cell| cell.text} }
  expected_table.diff!(actual_table)
end

Given(/^there is an exhibition called "(.*?)"$/) do |name|
  @exhibition = FactoryGirl.create(:exhibition, name: name)
end