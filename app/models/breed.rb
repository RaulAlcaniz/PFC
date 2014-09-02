class Breed < ActiveRecord::Base
  belongs_to :breedable, polymorphic: true
  has_many :varieties
  has_many :dogs, as: :dogable
  accepts_nested_attributes_for :dogs

  validates :name, presence: true, uniqueness: {case_sensitive: false}
end
