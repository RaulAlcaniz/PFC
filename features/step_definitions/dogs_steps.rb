Given(/^there are some breeds ordered by name:$/) do |table|
  table.map_headers!('Name' => :name)
  table.hashes.each do |attributes|
    FactoryGirl.create(:breed, attributes)
  end
end

Given(/^"(.*?)" is an owner for a dog which name is "(.*?)"$/) do |owner, name|
  step "there is a person called \"#{owner}\"" unless Person.find_by_name(owner)
  @dog = FactoryGirl.create(:dog, name: name, person_id: @person.id)
end

When /^I select "([^"]*)" as the (.+) "([^"]*)"$/ do |date, model, selector|
#  begin
#    date = DateTime.parse(date)
# rescue ArgumentError
#   date = DateTime.now + 1.year
# end

  if date.include?('after')
    date = DateTime.now + 1.hour
  elsif date.include?('before')
    date = DateTime.now - 1.hour
  else
    date = DateTime.parse(date)
  end

  select(date.year.to_s, :from => "#{model}[#{selector}(1i)]")
  select(date.strftime('%B'), :from => "#{model}[#{selector}(2i)]")
  select(date.day.to_s, :from => "#{model}[#{selector}(3i)]")
  if date.hour != 0
    select(date.strftime('%H'), :from => "#{model}[#{selector}(4i)]")
    select(date.strftime('%M'), :from => "#{model}[#{selector}(5i)]")
  end
end

Given(/^"(.*?)" is owner for some dogs:$/) do |owner, table|
  table.map_headers!('Name' => :name, 'Date of birth'=> :date_of_birth,
                     'Sex' => :sex, 'Sire' => :sire, 'Dam' => :dam,
                     'Titles' => :titles)
  table.hashes.each do |attributes|
    User.find_by_email(owner).person.dogs.create!(attributes)
  end
end

Given(/^"(.*?)" breed is "(.*?)"( with "(.*?)" variety)?( and "(.*?)" subvariety)?$/) do
  |name, breed, has_variety, variety_name, has_subvariety, subvariety_name|

  if (has_variety.eql? " with \"#{variety_name}\" variety" or !has_variety) and
      (has_subvariety.eql? " and \"#{subvariety_name}\" subvariety" or !has_subvariety)
    dog = Dog.find_by_name(name)
    dog.dogable = Subvariety.find_by_name(subvariety_name) ||
        Variety.find_by_name(variety_name) ||
        Breed.find_by_name!(breed)
    dog.save!
  else
    fail(ArgumentError.new('Syntax Error!'))
  end
end

Then(/^I should see "(.*?)" and "(.*?)"$/) do |arg1, arg2|
  steps %Q{
    Then I should see "#{arg1}"
    Then I should see "#{arg2}"
  }
end

Given(/^there are these entry deadlines for "(.*?)":$/) do |exhib_name, table|
  #@deadlines = table.hashes
  table.map_headers!('Name' => :name, 'Start date' => :start_date, 'End date' => :end_date)
  @deadlines = { "#{exhib_name}"  => table.hashes }

  #puts @deadlines["#{exhib_name}"]
  @deadlines["#{exhib_name}"].each do |att|
    puts att[:name]
    puts att[:start_date]
    puts att[:end_date]
  end

    #@deadlines.each do |att|
    #  puts att['Name']
    #end
end


#Then /^"([^"]*)" should be an option for "([^"]*)"(?: within "([^\"]*)")?$/ do |value, field, selector|
#  with_scope(selector) do
#    field_labeled(field).first(:xpath, ".//option[text() = '#{value}']").send(:should, be_present)
#  end
#end

#When /^I select "(.*?)" from "(.*?)"$/ do |option, field|
#  page.select option, :from => field
#end


