class Subvariety < ActiveRecord::Base
  belongs_to :variety
  has_many :dogs, as: :dogable

  validates :name, presence: true

  def get_breed
    self.variety.breed
  end

  def get_variety
    self.variety
  end

  def get_subvariety
    self
  end
end
