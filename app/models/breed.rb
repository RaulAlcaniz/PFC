class Breed < ActiveRecord::Base
  belongs_to :breedable, polymorphic: true
  has_many :varieties

  validates :name, presence: true
end