Given(/^there are some breeds ordered by name:$/) do |table|
  table.map_headers!('Name' => :name)
  table.hashes.each do |attributes|
    FactoryGirl.create(:breed, attributes)
  end
end

#Given(/^there is a dog called "(.*?)"$/) do |name|
#  @dog = FactoryGirl.create(:dog, name: name)
#end


When /^I select "([^"]*)" as the (.+) "([^"]*)"$/ do |date, model, selector|
  date = Date.parse(date)
  select(date.year.to_s, :from => "#{model}[#{selector}(1i)]")
  select(date.strftime("%B"), :from => "#{model}[#{selector}(2i)]")
  select(date.day.to_s, :from => "#{model}[#{selector}(3i)]")
end

#Then /^"([^"]*)" should be an option for "([^"]*)"(?: within "([^\"]*)")?$/ do |value, field, selector|
#  with_scope(selector) do
#    field_labeled(field).first(:xpath, ".//option[text() = '#{value}']").send(:should, be_present)
#  end
#end

#When /^I select "(.*?)" from "(.*?)"$/ do |option, field|
#  page.select option, :from => field
#end


