class Breed < ActiveRecord::Base
  belongs_to :breedable, polymorphic: true
  has_many :varieties
  has_many :dogs, as: :dogable

  validates :name, presence: true, uniqueness: {case_sensitive: false}

  def get_breed
    self
  end
end
