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

When(/^I follow "(.*?)" for my dogs? "(.*?)"$/) do |text, dog_names|
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
        # if action.include? 'Payment'
        #   current_path.should == "/payments/#{enrolment.payment_id}?exhibition_id=#{enrolment.exhibition_id}"
        # else
          current_path.should == "#{Payment.find{enrolment.payment_id}.receipt}"
        # end
      end
    end
  end
end

When(/^I follow "(.*?)" for "(.*?)"$/) do |text, exhibition_name|
  page.all('a', text: "#{text}").each do |link|
    link.click if link[:href] == "/exhibitions/#{Exhibition.find_by_name(exhibition_name).id}/enrolments"
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
#
# When(/^I follow "(.*?)" for "(.*?)" for "(.*?)" class in "(.*?)"$/) do |text, dog_name, dog_class, exhibition|
#   pay_id = Enrolment.where(dog_id: Dog.find_by_name(dog_name)).where(dog_class: dog_class).first.payment_id
#   puts (Exhibition.find_by_name exhibition).id
#   page.all('a', text: "#{text}").each do |link|
#     puts link[:href]
#     link.click if link[:href] == "/payments/#{pay_id}?exhibition_id=#{(Exhibition.find_by_name exhibition).id}"
#   end
# end
#
# # When(/^I follow "(.*?)" for "(.*?)" in "(.*?)" for "(.*?)" class$/) do |text, dog_name, exhibition, dog_class|
# #   pay_id = Enrolment.where(dog_id: Dog.find_by_name(dog_name)).where(dog_class: dog_class).first.payment_id
# #   page.all('a', text: "#{text}").each do |link|
# #     link.click if link[:href] == "/payments/#{pay_id}?exhibition_id=#{(Exhibition.find_by_name exhibition).id}"
# #   end
# # end


