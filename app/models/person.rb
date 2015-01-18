class Person < ActiveRecord::Base
  belongs_to :user
  has_many :dogs

  validates :name, presence: true
  validates :date_of_birth, presence: true
  validates_presence_of :sex, :country
  validate :born_in_future


  def born_in_future
    errors.add(:date_of_birth, 'must be before today') if self.date_of_birth >= Date.today
  end
end
