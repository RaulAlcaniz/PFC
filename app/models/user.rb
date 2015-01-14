class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  has_one :person

  after_create{create_person(name: self.email, sex: "Not selected",
                             date_of_birth: "01/01/2000", country: "Not selected")}

  scope :admin?, -> {where(admin: true)}

  # scope :admin?, ->(user_id) do
  #   #puts User.find(admin: true)
  #   User.where(id: user_id).where(admin: true)
  # end

end
