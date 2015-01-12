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

Given /^today is "([^"]*)"$/ do |date|
  travel_to DateTime.parse(date)
end

After('@time_travel') do
  travel_back
end

When /^I select "([^"]*)" as the (.+) "([^"]*)"$/ do |date, model, selector|
  date = Time.parse(date)

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
  puts @deadlines
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

Given(/^there are these payments for "(.*?)" in "(.*?)":$/) do |clients, exhib_name, prices_table|
  clients = clients.gsub(/\s+/, '')

  @classes =  prices_table.hashes.group_by { |type| type[:Class] }
  sd = []
  @classes.each do |class_name,class_group|
    @deadlines["#{exhib_name}"].each_with_index do |date, index|
      puts date[:name]
      deadline_prices = []
      class_group.each do |j|
        deadline_prices << j[date[:name]]
      end
      sd << { "#{class_name}"  => deadline_prices }
      puts sd
    end

  end

  #prices_table.hashes.each do |attributes|
  #  if attributes[:Class] != base
  #    classes_number = classes_number+1
  #    base = attributes[:Class]
  #  end
  #
  #end
  #  puts classes_number
end


#
#@tax = {:groups=> @groups['Exp. Canina de Cieza'],
#        :deadlines=> @fechas['Exp. Canina de Cieza'],
#        :prices=> [
#            {:partners=>[
#                {@tax[:groups].first[:name]=>[
#                    {@tax[:deadlines].first[:name]=>['24.00', '19.00', '14.00']},
#                    {@tax[:deadlines].second[:name]=>['30.00', '23.00', '18.00']},
#                    {@tax[:deadlines].third[:name]=>['36.00', '27.00', '21.00']}]},
#                {@tax[:groups].second[:name]=>[
#                    {@tax[:deadlines].first[:name]=>['12.00', '9.50', '7.00']},
#                    {@tax[:deadlines].second[:name]=>['15.00', '11.50', '9.00']},
#                    {@tax[:deadlines].third[:name]=>['18.00', '13.50', '10.50']}]},
#                {@tax[:groups].third[:name]=>[
#                    {@tax[:deadlines].first[:name]=>['16.00', '12.00', '9.00']},
#                    {@tax[:deadlines].second[:name]=>['20.00', '15.00', '12.00']},
#                    {@tax[:deadlines].third[:name]=>['24.00', '18.00', '15.00']}]},
#                {@tax[:groups].fourth[:name]=>[
#                    {@tax[:deadlines].first[:name]=>[:price1=>'20.00']},
#                    {@tax[:deadlines].second[:name]=>[:price1=>'25.00']},
#                    {@tax[:deadlines].third[:name]=>[:price1=>'29.00']}]},
#                {@tax[:groups].fourth[:name]=>[
#                    {@tax[:deadlines].first[:name]=>[:price1=>'0.00']},
#                    {@tax[:deadlines].second[:name]=>[:price1=>'0.00']},
#                    {@tax[:deadlines].third[:name]=>[:price1=>'0.00']}]}]},
#            {:nopartners=>[
#                {@tax[:groups].first[:name]=>[
#                    {@tax[:deadlines].first[:name]=>['30.00', '25.00', '20.00']},
#                    {@tax[:deadlines].second[:name]=>['37.50', '32.00', '25.00']},
#                    {@tax[:deadlines].third[:name]=>['43.50', '37.00', '29.00']}]},
#                {@tax[:groups].second[:name]=>[
#                    {@tax[:deadlines].first[:name]=>['15.00', '12.50', '10.00']},
#                    {@tax[:deadlines].second[:name]=>['18.70', '16.00', '12.50']},
#                    {@tax[:deadlines].third[:name]=>['21.75', '18.50', '14.50']}]},
#                {@tax[:groups].third[:name]=>[
#                    {@tax[:deadlines].first[:name]=>['21.00', '15.00', '11.00']},
#                    {@tax[:deadlines].second[:name]=>['27.00', '19.00', '14.00']},
#                    {@tax[:deadlines].third[:name]=>['31.00', '21.00', '17.00']}]},
#                {@tax[:groups].fourth[:name]=>[
#                    {@tax[:deadlines].first[:name]=>[:price1=>'25.00']},
#                    {@tax[:deadlines].second[:name]=>[:price1=>'32.00']},
#                    {@tax[:deadlines].third[:name]=>[:price1=>'37.00']}]},
#                {@tax[:groups].fourth[:name]=>[
#                    {@tax[:deadlines].first[:name]=>[:price1=>'0.00']},
#                    {@tax[:deadlines].second[:name]=>[:price1=>'0.00']},
#                    {@tax[:deadlines].third[:name]=>[:price1=>'0.00']}]}]}]}
#                   #{:nopartners=>[
#                   #    {:group1=>[{:price1=>'30.00', :price2=>'25.00', :price3=>'20.00'}, {:price1=>'37.50', :price2=>'32.00', :price3=>'25.00'}, {:price1=>'43.50', :price2=>'37.00', :price3=>'29.00'}]},
#                   #    {:group2=>[{:price1=>'15.00', :price2=>'12.50', :price3=>'10.00'}, {:price1=>'18.75', :price2=>'16.00', :price3=>'12.50'}, {:price1=>'21.75', :price2=>'18.50', :price3=>'14.50'}]},
#                   #    {:group3=>[{:price1=>'21.00', :price2=>'15.00', :price3=>'11.00'}, {:price1=>'27.00', :price2=>'19.00', :price3=>'14.00'}, {:price1=>'31.00', :price2=>'21.00', :price3=>'17.00'}]},
#                   #    {:group4=>[{:price1=>'25.00'}, {:price1=>'32.00'}, {:price1=>'37.00'}]},
#                   #    {:group5=>[{:price1=>'0.00'}, {:price1=>'0.00'}, {:price1=>'0.00'}]}]}]}
#
#
#
#@tax = {:groups=> @groups['Exp. Canina de Cieza'],
#        :deadlines=> @deadlines['Exp. Canina de Cieza'],
#        :prices=> [{:partners=>[
#            {:group1=>[{:price1=>'24.00', :price2=>'19.00', :price3=>'14.00'}, {:price1=>'30.00', :price2=>'23.00', :price3=>'18.00'}, {:price1=>'36.00', :price2=>'27.00', :price3=>'21.00'}]},
#            {:group2=>[{:price1=>'12.00', :price2=>'9.50', :price3=>'7.00'}, {:price1=>'15.00', :price2=>'11.50', :price3=>'9.00'}, {:price1=>'18.00', :price2=>'13.50', :price3=>'10.50'}]},
#            {:group3=>[{:price1=>'16.00', :price2=>'12.00', :price3=>'9.00'}, {:price1=>'20.00', :price2=>'15.00', :price3=>'12.00'}, {:price1=>'24.00', :price2=>'18.00', :price3=>'15.00'}]},
#            {:group4=>[{:price1=>'20.00'}, {:price1=>'25.00'}, {:price1=>'29.00'}]},
#            {:group5=>[{:price1=>'0.00'}, {:price1=>'0.00'}, {:price1=>'0.00'}]}]},
#                   {:nopartners=>[
#                       {:group1=>[{:price1=>'30.00', :price2=>'25.00', :price3=>'20.00'}, {:price1=>'37.50', :price2=>'32.00', :price3=>'25.00'}, {:price1=>'43.50', :price2=>'37.00', :price3=>'29.00'}]},
#                       {:group2=>[{:price1=>'15.00', :price2=>'12.50', :price3=>'10.00'}, {:price1=>'18.75', :price2=>'16.00', :price3=>'12.50'}, {:price1=>'21.75', :price2=>'18.50', :price3=>'14.50'}]},
#                       {:group3=>[{:price1=>'21.00', :price2=>'15.00', :price3=>'11.00'}, {:price1=>'27.00', :price2=>'19.00', :price3=>'14.00'}, {:price1=>'31.00', :price2=>'21.00', :price3=>'17.00'}]},
#                       {:group4=>[{:price1=>'25.00'}, {:price1=>'32.00'}, {:price1=>'37.00'}]},
#                       {:group5=>[{:price1=>'0.00'}, {:price1=>'0.00'}, {:price1=>'0.00'}]}]}]}


#Then /^"([^"]*)" should be an option for "([^"]*)"(?: within "([^\"]*)")?$/ do |value, field, selector|
#  with_scope(selector) do
#    field_labeled(field).first(:xpath, ".//option[text() = '#{value}']").send(:should, be_present)
#  end
#end

#When /^I select "(.*?)" from "(.*?)"$/ do |option, field|
#  page.select option, :from => field
#end


