class Subvariety < ActiveRecord::Base
  belongs_to :variety
  has_many :dogs, as: :dogable

  validates :name, presence: true
end
