# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

[
    ['Group I', 'Sheepdogs and Cattle Dogs (except Swiss Cattle Dogs)'],
    ['Group II', 'Pinscher and Schnauzer - Molossoid Breeds - Swiss Mountain and Cattle Dogs'],
    ['Group III', 'Terriers']
].each do |name, description|
  Group.create!(name: name, description: description)
end