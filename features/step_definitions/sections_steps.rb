Given(/^there are sections for this group:$/) do |table|
  # table is a Cucumber::Ast::Table
  table.map_headers!('SECTION ID' => :id, 'GROUP ID' => :group_id, 'Section number' => :name, 'Description' => :description)
  table.hashes.each do |attributes|
    @group.sections.create!(attributes)
  end
end