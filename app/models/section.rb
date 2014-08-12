class Section < ActiveRecord::Base
  belongs_to :group
  has_many :subsections, dependent: :destroy
  has_many :breeds, as: :breedable, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true, uniqueness: {case_sensitive: false}
end
