class Payment < ActiveRecord::Base
  states = %w{ verified unverified rejected recent }

  states.each do |state|
    define_method("#{state}?") do
      self.state == state
    end

    #define_method("#{state}!") do
    #  self.update_attribute(:state, state)
    #end
  end
end