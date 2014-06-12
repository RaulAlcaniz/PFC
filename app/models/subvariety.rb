class Subvariety < ActiveRecord::Base
  belongs_to :variety

  validates :name, presence: true
end
