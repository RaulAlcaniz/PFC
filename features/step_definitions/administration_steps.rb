Then(/^I should be able to add a new dog for "(.*?)"$/) do |user|
  step "I am on the person page for \"#{user}\""
  step 'there are some breeds ordered by name:', table(%{
  | Name              |
  | Australian Kelpie |
  })
  step 'I follow "Add a dog"'
  step 'the select "breed" should have following options:', table(%{
  | Select breed...   |
  | Australian Kelpie |
  })
  steps %{
    When I fill in "Name" with "Snoopy"
    And I fill in "Sire" with "Rex"
    And I fill in "Dam" with "Missy"
    And I select "Male" from "Sex"
    And I select "May 7, 2010" as the dog "date_of_birth"
    And I select "Australian Kelpie" from "breed"
    And I press "Create Dog"
  }
end

Given(/^I should be able to "(.*?)" the "(.*?)" "(.*?)"$/) do |action, model, name|
    case action
      when 'view'
        step 'I am on the home page'
        case model
          when 'dog'
            visit ("people/#{Person.find(Dog.find_by_name(name).person_id).id}/dogs/#{Dog.find_by_name(name).id}")
          when 'exhibition'
            visit ("exhibitions/#{Exhibition.find_by_name!(name).id}")
        end
      when 'delete'
        steps %{
          Given I am on the #{model} page for "#{name}"
          When I follow "Delete #{model.capitalize}"
          Then I should see "#{model.capitalize} has been deleted."
        }
      when 'edit'
        steps %{
          Given I am on the #{model} page for "#{name}"
          When I follow "Edit #{model.capitalize}"
          And I press "Update #{model.capitalize}"
          Then I should be on the #{model} page for "#{name}"
          Then I should see "#{model.capitalize} has been updated."
        }
    end
end


Given(/^the exhibition "(.*?)" exists$/) do |exhibition|
  step 'today is "10-12-2013"'
  step 'there are exhibitions with these entries:', table(%{
    | Name          | Description     | Start date  | End date    |
    | #{exhibition} | www.example.org | Sep 1, 2014 | Sep 3, 2014 |
  })
  step "there are these entry deadlines for \"#{exhibition}\":", table(%{
    | Name               | Start date | End date   |
    | 1st entry deadline | 08-01-2014 | 22-02-2014 |
  })
  step "there are these payments for \"partners\" in \"#{exhibition}\":", table(%{
    | Class           | Dogs              | 1st entry deadline |
    | J. I. O. W. CH. | 1st dog           | 24.00              |
    | J. I. O. W. CH. | 2nd dog           | 19.00              |
    | J. I. O. W. CH. | 3rd and following | 14.00              |
  })
end

Given(/^"(.*?)" has "(.*?)" enrolled in "(.*?)"$/) do |user, dog, exhibition|
  steps %{
      Given today is "15-03-2014"
      And I am signed in as "#{user}"
      Given I have "#{dog}" enrolled in "#{exhibition}" in "Champion" class on "10-02-2014"
      And I follow "Sign out"
  }
end

Given(/^the payment of "(.*?)" for "(.*?)" class is( not)? sending( and "(.*?)")?$/) do |dog, dog_class, negate, arg,status|

  if negate
    step "I have not sent the payment of \"#{dog}\" for \"#{dog_class}\" class"
  else
    steps %{
      Given I have sent the payment of "#{dog}" for "#{dog_class}" class
      And the payment status of "#{dog}" for "#{dog_class}" class is "#{status}"
    }
  end
end

Then(/^I should( not)? be able to enroll a dog$/) do |negate|
  if negate
    page.should_not have_button('Enroll a new dog')
  else
    page.should have_button('Enroll a new dog')
  end
end

Then(/^I should( not)? be able to upload a bank receipt$/) do |negate|
  if negate
    page.should_not have_button('Upload the Bank Receipt')
  else
    page.should have_button('Upload the Bank Receipt')
  end
end

Then(/^the payments page should content:$/) do |expected_table|
  rows = find('table#payments').all('tr')
  actual_table = rows.map{ |row| row.all('th, td').map{ |cell| cell.text} }
  expected_table.diff!(actual_table)
end


