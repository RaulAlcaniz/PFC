class Payment < ActiveRecord::Base
  has_one :enrolment
  states = %w{ accepted rejected unverified }
  validates_presence_of :receipt, message: 'You must select a file to attach.'
  mount_uploader :receipt, ReceiptUploader

  #scope to check that one user owns the payment that is attempting to access
  scope :for, ->(person) do
    User.find(person.try(:user_id)).admin? ? Payment.all : Payment.where(id: Enrolment.select(:payment_id).where(dog_id: Dog.select(:id).where(person_id: person)))
  end

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