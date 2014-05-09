class Section < ActiveRecord::Base
  belongs_to :group

  validates :name, presence: true
  validates :description, presence: true, uniqueness: {case_sensitive: false}
end
