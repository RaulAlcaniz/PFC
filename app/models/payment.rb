class Payment < ActiveRecord::Base
  states = %w{ accepted rejected unverified }
  validates_presence_of :receipt, message: 'You must select a file to attach.'
  mount_uploader :receipt, ReceiptUploader

  states.each do |state|
    define_method("#{state}?") do
      self.status == state
    end

    define_method("#{state}!") do
      self.update_attribute(:status, state)
    end
  end
   define_method('states') do
     states
   end
end