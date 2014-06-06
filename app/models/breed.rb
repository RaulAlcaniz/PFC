class Breed < ActiveRecord::Base
  belongs_to :breedable, polymorphic: true

  validates :name, presence: true
end
