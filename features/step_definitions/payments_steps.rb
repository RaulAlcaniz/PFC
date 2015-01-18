Given(/^I have( not)? sent the payment of "(.*?)" for "(.*?)" class$/) do |negate, dog_names, dog_classes|
  amount = 0
  dog_names.gsub(/and/,',').split(',').each_with_index do |dog_name,index|
    amount += Enrolment.find_by(dog_id: Dog.find_by_name("#{dog_name.strip}").id,
                                dog_class: "#{dog_classes.gsub(/and/,',').split(',')[index].strip}").price
  end
  payment = FactoryGirl.create(:payment, amount: amount) if not negate
  dog_names.gsub(/and/,',').split(',').each_with_index do |dog_name,index|
    if negate
      Enrolment.find_by(dog_id: Dog.find_by_name("#{dog_name.strip}").id,
                        dog_class: "#{dog_classes.gsub(/and/,',').split(',')[index].strip}").
          payment_id.should be_nil
    else
      Enrolment.find_by(dog_id: Dog.find_by_name("#{dog_name.strip}").id,
                        dog_class: "#{dog_classes.gsub(/and/,',').split(',')[index].strip}").
          update_attributes(payment_id: payment.id)
    end
  end
end

Then(/^I can't remove both enrolments$/) do
  step 'I am on the enrolments page for "Exp. Canina de Cieza"'
  step 'I should not see "Remove"'
end

When(/^I follow "(.*?)" for the dogs? "(.*?)"$/) do |text, dog_names|
  flag = false
  dog_names.gsub(/and/,',').split(',').each do |dog_name|
    Enrolment.where(dog_id: Dog.find_by_name("#{dog_name.strip}").id).each do |enrolment|
      if Enrolment.where(payment_id: enrolment.id).count  == dog_names.gsub(/and/,',').split(',').count
        page.all('a', text: "#{text}").each do |link|
          if text.include? 'Payment'
            (flag = true and link.click) if link[:href] == "/payments/#{enrolment.payment_id}?exhibition_id=#{enrolment.exhibition_id}"
          else
            (flag = true and link.click) if link[:href] == "#{Payment.find{enrolment.payment_id}.receipt}"
          end
        end
      end
    end
  end
  flag.should be true
end

Then(/^I should see the bank receipt for "(.*?)"$/) do |dog_names|
  dog_names.gsub(/and/,',').split(',').each do |dog_name|
    Enrolment.where(dog_id: Dog.find_by_name("#{dog_name.strip}").id).each do |enrolment|
      if Enrolment.where(payment_id: enrolment.id).count  == dog_names.gsub(/and/,',').split(',').count
          current_path.should == "#{Payment.find{enrolment.payment_id}.receipt}"
      end
    end
  end
end

When(/^I follow "(.*?)" for "(.*?)"$/) do |text, exhibition_name|
  page.all('a', text: "#{text}").each do |link|
    if text.include? 'View'
      link.click if link[:href] == "#{current_path}/#{Exhibition.find_by_name(exhibition_name).id}/enrolments"
    else
      link.click if link[:href] == "/exhibitions/#{Exhibition.find_by_name(exhibition_name).id}/enrolments"
    end
  end
end

Given(/^the payment status of "(.*?)" for "(.*?)" class is( not)? "(.*?)"$/) do |dog_names, dog_classes, negate, status|
  dog_names.gsub(/and/,',').split(',').each_with_index do |dog_name,index|
     if negate
      Payment.find(Enrolment.find_by(dog_id: Dog.find_by_name("#{dog_name.strip}").id,
                        dog_class: "#{dog_classes.gsub(/and/,',').split(',')[index].strip}").payment_id).
               status.should_not be status
     else
       Payment.find(Enrolment.find_by(dog_id: Dog.find_by_name("#{dog_name.strip}").id,
                                       dog_class: "#{dog_classes.gsub(/and/,',').split(',')[index].strip}").payment_id).
           update_attributes(status: status)
     end
  end
end

When(/^I try to "(.*?)" the payments for "(.*?)" in "(.*?)"$/) do |action, user, exhibition|
  case action
    when 'view'
      visit ("payments/#{Payment.find(Enrolment.find_by(
                                          dog_id: Dog.find_by_person_id(
                                              User.find_by_email(user)))).id}?exhibition_id=#{Exhibition.find_by_name(exhibition).id}")
    when 'edit'
      visit ("payments/#{Payment.find(Enrolment.find_by(
                                          dog_id: Dog.find_by_person_id(
                                              User.find_by_email(user)))).id}/edit")
  end
end

When(/^I try to access to a invalid payment$/) do
  visit ('payments/-1/edit')
end

When(/^I follow "(.*?)" for "(.*?)" payment$/) do |text, arg2|
  page.all('a', text: "#{text}").each do |link|
      link.click if link[:href].include? "#{Payment.find_by_id(Enrolment.select(:payment_id).where(dog_id: Dog.select(:id).where(name: arg2))).id}"
  end
end

