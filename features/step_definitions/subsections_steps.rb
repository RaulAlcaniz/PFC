Given(/^there are subsections for the section with section number "(.*?)":$/) do |name, table|
  table.map_headers!('Subsection number' => :name, 'Description' => :description)
  section = @group.sections.find_by_name name
  table.hashes.each do |attributes|
    section.subsections.create!(attributes)
  end
end