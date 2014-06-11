class Variety < ActiveRecord::Base
  belongs_to :breed

  validates :name, presence: true
end
