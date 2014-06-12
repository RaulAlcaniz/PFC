Given(/^there are subvarities for the variety "(.*?)":$/) do |variety, table|
  table.map_headers!('Name' => :name)
  variety = @breed.varieties.find_by_name variety
  table.hashes.each do |attributes|
    variety.subvarieties.create!(attributes)
  end
end