class Variety < ActiveRecord::Base
  belongs_to :breed
  has_many :subvarieties
  has_many :dogs, as: :dogable

  validates :name, presence: true

  def get_breed
    self.breed
  end

  def get_variety
    self
  end
end
