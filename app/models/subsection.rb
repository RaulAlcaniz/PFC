class Subsection < ActiveRecord::Base
  belongs_to :section

  validates :name, presence: true
  validates :description, presence: true
end
