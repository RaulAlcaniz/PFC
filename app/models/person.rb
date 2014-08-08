class Person < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true, uniqueness: {case_sensitive: false}
  validates :date_of_birth, presence: true
  validates_presence_of :sex, :country
end
