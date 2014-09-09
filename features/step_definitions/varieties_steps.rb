Given(/^there are varieties for the breed "(.*?)":$/) do |breed, table|
  table.map_headers!('Name' => :name)
  @breed = Breed.find_by_name breed
  @breed = @section.breeds.find_by_name breed if @section
  @breed = @subsection.breeds.find_by_name breed if @subsection

  table.hashes.each do |attributes|
    @breed.varieties.create!(attributes)
  end
end