Given(/^sections with these entries:$/) do |table|
  # table is a Cucumber::Ast::Table
  table.map_headers!('SECTION ID' => :id, 'GROUP ID' => :group_id, 'Section number' => :name, 'Description' => :description)
  table.hashes.map{|hash| FactoryGirl.create(:section, hash)}
end

When(/^the group "(.*?)" page is visited$/) do |group_id|
  visit "groups/#{group_id}"
end

Then(/^the group page should content$/) do |expected_table|
  # table is a Cucumber::Ast::Table
  rows = find('table#sections').all('tr')
  actual_table = rows.map{ |row| row.all('th, td').map{ |cell| cell.text} }
  expected_table.diff!(actual_table)
end

Given(/^There is a group called "(.*?)"$/) do |name|
    @group = FactoryGirl.create(:group, name: name) # pq se lo asignamos a group? es una variable local al bloque, no? una vez termina el bloque se elimina la variable, así q para q sirve?
end