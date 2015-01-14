class Person < ActiveRecord::Base
  belongs_to :user
  has_many :dogs

  validates :name, presence: true
  validates :date_of_birth, presence: true
  validates_presence_of :sex, :country
end
