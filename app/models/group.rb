class Group < ActiveRecord::Base
  has_many :sections, dependent: :destroy
  validates :name, presence: true, uniqueness: {case_sensitive: false}
  validates :description, presence: true, uniqueness: {case_sensitive: false}
end
