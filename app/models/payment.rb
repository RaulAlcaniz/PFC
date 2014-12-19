class Payment < ActiveRecord::Base
  states = %w{ verified unverified rejected recent }

  states.each do |state|
    define_method("#{state}?") do
      self.status == state
    end

    define_method("#{state}!") do
      self.update_attribute(:status, state)
    end
  end
  define_method('status?') do
    self.status
  end
end