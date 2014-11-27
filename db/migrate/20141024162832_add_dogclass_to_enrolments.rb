class AddDogclassToEnrolments < ActiveRecord::Migration
  def change
    add_column :enrolments, :dog_class, :string
  end
end
