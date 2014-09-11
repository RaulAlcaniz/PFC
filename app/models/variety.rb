class Variety < ActiveRecord::Base
  belongs_to :breed
  has_many :subvarieties
  has_many :dogs, as: :dogable

  validates :name, presence: true
end
