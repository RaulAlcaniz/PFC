class Group < ActiveRecord::Base
  has_many :sections
  validates :name, presence: true, uniqueness: {case_sensitive: false}
  validates :description, presence: true, uniqueness: {case_sensitive: false}
end
