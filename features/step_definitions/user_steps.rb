require 'date'

Given(/^there are the following users:$/) do |table|
  table.hashes.each do |attributes|
    unconfirmed = attributes.delete('unconfirmed') == 'true'
    @user = User.create!(attributes)
    @user.update_attribute(:admin, attributes[:admin] == 'true')
    @user.confirm! unless unconfirmed
  end
end

Given(/^I am( not)? signed in as them$/) do |negate|
  steps(%Q{
    Given I am on the homepage
    When I follow "Sign in"
    And I fill in "Email" with "#{@user.email}"
    And I fill in "Password" with "password"
    And I press "Sign in"
  })
  step 'I follow "Sign out"' if negate
end

Given(/^I am signed in as "(.*?)"$/) do |email|
  @user = User.find_by_email!(email)
  step('I am signed in as them')
end

Then(/^should be created a person called "(.*?)"$/) do |name|
  @person = Person.find_by_name!(name)
end

Then(/^"(.*?)" should be "(.*?)"$/) do |arg, value|
  register = @person.send(arg)
  register = register.strftime('%Y-%m-%d') if @person.send(arg).is_a? Date
  register.should == value
end
