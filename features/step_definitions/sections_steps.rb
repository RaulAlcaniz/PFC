Given(/^there are sections for this group:$/) do |table|
  # table is a Cucumber::Ast::Table
  table.map_headers!('Section number' => :name, 'Description' => :description)
  table.hashes.each do |attributes|
    @group.sections.create!(attributes)
  end
end

#Given(/^there is a section called "(.*?)"$/) do |name|
#  @section = FactoryGirl.create(:section, name: name)
#end

Given(/^there is a section which description is "(.*?)"$/) do |description|
  @section = FactoryGirl.create(:section, description: description)
end

Then(/^all "(.*?)" for this section should have been removed$/) do |arg|
  @section.send(arg).count.should eq 0
end

#Given(/^there are some breeds for the section "(.*?)":$/) do |description, table|
#  number = Section.find_by_description(description).name
# step "there are some breeds for the section number \"#{number}\":", table(%{
#     | Name                  |
#     | Australian Cattle Dog |
#  })
#end