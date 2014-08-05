Given(/^the select "(.*?)" has following options:$/) do |arg1, table|
  @date_options = table.raw
#  asd.each do |fecha|
#    puts fecha.to_s
#    date = Date.parse(fecha.to_s)
#  end
end


When /^(?:|I )select "([^\"]*)" as the "([^\"]*)" date$/ do |date, date_label|
  select_date(date, from: date_label)
end

DATE_TIME_SUFFIXES = {
    :year => '1i',
    :month => '2i',
    :day => '3i',
}

def select_date(date_to_select, options ={})
  date = date_to_select.is_a?(Date) || date_to_select.is_a?(Time) ? date_to_select : Date.parse(date_to_select)

  id_prefix = id_prefix_for(options)

  select date.year, :from => "#{id_prefix}_#{DATE_TIME_SUFFIXES[:year]}"
  select date.strftime('%B'), :from => "#{id_prefix}_#{DATE_TIME_SUFFIXES[:month]}"
  select date.day, :from => "#{id_prefix}_#{DATE_TIME_SUFFIXES[:day]}"
end

def id_prefix_for(options = {})
  msg = "cannot select option, no select box with id, name, or label '#{options[:from]}' found"
  locate(:xpath, Capybara::XPath.select(options[:from]), msg)['id'].gsub(/_#{DATE_TIME_SUFFIXES[:year]}$/,'')
end


#Given(/^there should be a select lists for day, month and year parts of the date of birth$/) do
#  on(Person) do |asd|
#    asd.date_of_birth_day_element.visible?.should == true
#    asd.dob_month_element.visible?.should == true
#    asd.dob_year_element.visible?.should == true
#  end
#end

#Parameters: {"utf8"=>"✓", "person"=>{"name"=>"asdfasf", "date_of_birth(1i)"=>"1924", "date_of_birth(2i)"=>"1", "date_of_birth(3i)"=>"1", "sex"=>"male", "country"=>"Armenia"}, "commit"=>"Create Person"}


#When /^I select "([^"]*)" as the "([^"]*)" date$/ do |date, selector|
#  date = Date.parse(date)
#  select(date.year.to_s, :from => "Person.#{selector}(1i)")
#  select(date.strftime("%B"), :from => "#{model}[#{selector}(2i)]")
#  select(date.day.to_s, :from => "#{model}[#{selector}(3i)]")
#end

#When /^(?:|I )select "([^\"]*)" as the "([^\"]*)" date$/ do |date, prefix|
#  date = Chronic.parse(date)

#  select date.year.to_s, :from => "#{prefix}_#{dt_suffix[:year]}"
#  select date.strftime("%B"), :from => "#{prefix}_#{dt_suffix[:month]}"
#  select date.day.to_s, :from => "#{prefix}_#{dt_suffix[:day]}"
#end

#def dt_suffix
#      :year => ’1i’
#      :month => ’2i’
#      :day => ’3i’
#      :hour => ’4i’
#      :minute => ’5i’
#end
