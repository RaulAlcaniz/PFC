Given(/^there are some breeds for the section number "(.*?)":$/) do |section, table|
  table.map_headers!('Name' => :name)
  @section = @group.sections.find_by_name section
  table.hashes.each do |attributes|
    @section.breeds.create!(attributes)
  end
end

Given(/^there are some breeds for the subsection with subsection number "(.*?)":$/) do |subsection, table|
  table.map_headers!('Name' => :name)
  @subsection = @section.subsections.find_by_name subsection
  table.hashes.each do |attributes|
    @subsection.breeds.create!(attributes)
  end
end