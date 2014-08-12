Given(/^there are subsections for the section with section number "(.*?)":$/) do |name, table|
  table.map_headers!('Subsection number' => :name, 'Description' => :description)
  @section = @group.sections.find_by_name name
  table.hashes.each do |attributes|
    @subsection = @section.subsections.create!(attributes)
  end
end

Given(/^there is a subsection which description is "(.*?)"$/) do |description|
  FactoryGirl.create(:subsection, description: description)
end

Then(/^all "(.*?)" for this subsection should have been removed$/) do |arg|
  @subsection.send(arg).count.should eq 0
end