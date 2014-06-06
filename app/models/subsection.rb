class Subsection < ActiveRecord::Base
  belongs_to :section
  has_many :breeds, as: :breedable

  validates :name, presence: true
  validates :description, presence: true
end
