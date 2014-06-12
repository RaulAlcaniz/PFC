class Variety < ActiveRecord::Base
  belongs_to :breed
  has_many :subvarieties

  validates :name, presence: true
end
