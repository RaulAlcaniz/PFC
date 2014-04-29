class Group < ActiveRecord::Base
  has_many :sections
  validates_presence_of :name, uniqueness: true
  validates_presence_of :description
end
