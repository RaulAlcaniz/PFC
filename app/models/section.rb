class Section < ActiveRecord::Base
  belongs_to :group
  has_many :subsections
  has_many :breeds, as: :breedable

  validates :name, presence: true
  validates :description, presence: true
end
