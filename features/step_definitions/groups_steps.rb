Given(/^groups with these entries:$/) do |table|
  # table is a Cucumber::Ast::Table
 table.map_headers!('GROUP ID' => :id, 'Name' => :name, 'Description'=> :description)
 table.hashes.map{|hash| FactoryGirl.create(:group, hash)}
end

When(/^the standards and nomenclature page is visited$/) do
 visit "groups/index"
end