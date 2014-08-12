Given(/^groups with these entries:$/) do |table|
  # table is a Cucumber::Ast::Table
 table.map_headers!('Name' => :name, 'Description'=> :description)
 table.hashes.map{|hash| FactoryGirl.create(:group, hash)}
end

When(/^the standards and nomenclature page is visited$/) do
 visit 'groups'
end

Then(/^the standards and nomenclature page should content:$/) do |expected_table|
  # table is a Cucumber::Ast::Table
  rows = find('table#groups').all('tr')
  actual_table = rows.map{ |row| row.all('th, td').map{ |cell| cell.text} }
  expected_table.diff!(actual_table)
end

Given(/^there is a group called "(.*?)"$/) do |name|
  @group = FactoryGirl.create(:group, name: name)
end

Given(/^there is a group which description is "(.*?)"$/) do |description|
  @group = FactoryGirl.create(:group, description: description)
end

Then(/^all sections for this group should have been removed$/) do
  @group.sections.count.should eq 0
end