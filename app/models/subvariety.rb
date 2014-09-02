class Subvariety < ActiveRecord::Base
  belongs_to :variety
  has_many :dogs, as: :dogable
  accepts_nested_attributes_for :dogs

  validates :name, presence: true
end
