Given(/^groups with these entries:$/) do |table|
  # table is a Cucumber::Ast::Table
 table.map_headers!('GROUP ID' => :id, 'Name' => :name, 'Description'=> :description)
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
  @group = FactoryGirl.create(:group, name: name) # pq se lo asignamos a group? es una variable local al bloque, no? una vez termina el bloque se elimina la variable, así q para q sirve?
end