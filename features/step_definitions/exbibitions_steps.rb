Given(/^there are exhibitions with these entries:$/) do |table|
  table.map_headers!('Name' => :name, 'Description'=> :description,
                     'Start date'=> :start_date, 'End date'=> :end_date)
  table.hashes.map{|hash| FactoryGirl.create(:exhibition, hash)}
end

Given(/^there is an exhibition called "(.*?)"$/) do |name|
  @exhibition = FactoryGirl.create(:exhibition, name: name)
end

When(/^the exhibitions page is visited$/) do
  visit 'exhibitions'
end

Then(/^the exhibitions page should content:$/) do |expected_table|
  rows = find('table#exhibitions').all('tr')
  actual_table = rows.map{ |row| row.all('th, td').map{ |cell| cell.text} }
  expected_table.diff!(actual_table)
end

def get_abbreviations(text)
  text.strip!
  [
      ['J', 'Junior'],
      ['I', 'Intermediate'],
      ['O', 'Open'],
      ['W', 'Working'],
      ['CH', 'Champion']

  ].each do |input, output|
    text.sub! input,output
  end
end

Given(/^there are these entry deadlines for "(.*?)":$/) do |exhib_name, table|
  table.map_headers!('Name' => :name, 'Start date' => :start_date, 'End date' => :end_date)
  @deadlines = { "#{exhib_name}"  => table.hashes }
end

Given(/^there are these payments for "(.*?)" in "(.*?)":$/) do |clients, exhib_name, prices_table|

  @classes =  prices_table.hashes.group_by { |type| type[:Class] }

  group_deadline_prices = []
  prices_collect= []
  grouped_classes = []
  index = 1
  @classes.each do |class_name, class_group|
    @deadlines["#{exhib_name}"].each do |date|
      deadline_prices = []
      class_group.each { |k| deadline_prices << k[date[:name]] }
      group_deadline_prices << deadline_prices
    end

    grouped_classes << {:name => 'group'"#{index}", :classes =>"#{class_name}".split('.')}
    prices_collect << ['group'"#{index}", group_deadline_prices]
    group_deadline_prices = []
    index += 1
  end
  grouped_classes.each do |normalize_hash|
    normalize_hash[:classes].each {|normalize| get_abbreviations normalize}
  end
  @groups = Hash.new
  @groups["#{exhib_name}"] = grouped_classes

  prices_collect = prices_collect.map {|key, value| {key=> value}}

  if not Exhibition.find_by_name(exhib_name).tax
  #if not @tax
    @tax = {:groups  => @groups["#{exhib_name}"]}
    @tax.merge!(:deadlines => @deadlines["#{exhib_name}"])
    @tax[:prices] = []
  end
  @tax[:prices].push ({:"#{clients.gsub(/\s+/, '')}" => prices_collect})

  Exhibition.find_by_name(exhib_name).update_attributes(tax: @tax.to_json)
end

Given(/^"(.*?)" has the same specifications than "(.*?)"$/) do |exhibition1, exhibition2|
  Exhibition.find_by_name(exhibition1).update_attributes(tax:  Exhibition.find_by_name(exhibition2).tax)
end

When(/^I try to access the admin page for exhibitions of "(.*?)"$/) do |user|
  visit ("people/#{Person.find_by_name(user).id}/exhibitions/")
end

Given(/^payment deadlines began for "(.*?)"$/) do |exhibition|
  step "today is \"#{(Date.parse(JSON.parse(Exhibition.find_by_name(exhibition).tax)['deadlines'].first['start_date']))+1.day}\""
end

Given(/^there are no prices set for "(.*?)"$/) do |exhibition|
  Exhibition.find_by_name(exhibition).update_attributes(tax: nil)
end


