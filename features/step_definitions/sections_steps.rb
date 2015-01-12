Given(/^there are sections for this group:$/) do |table|
  # table is a Cucumber::Ast::Table
  table.map_headers!('Section number' => :name, 'Description' => :description)
  table.hashes.each do |attributes|
    @group.sections.create!(attributes)
  end
end

Given(/^there is a section which description is "(.*?)"$/) do |description|
  @section = FactoryGirl.create(:section, description: description)
end

Then(/^all "(.*?)" for this section should have been removed$/) do |arg|
  @section.send(arg).count.should eq 0
end