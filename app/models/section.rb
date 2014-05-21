class Section < ActiveRecord::Base
  belongs_to :group
  has_many :subsections

  validates :name, presence: true
  validates :description, presence: true
end
