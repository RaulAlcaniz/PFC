class Variety < ActiveRecord::Base
  belongs_to :breed
  has_many :subvarieties
  has_many :dogs, as: :dogable
  accepts_nested_attributes_for :dogs

  validates :name, presence: true
end
