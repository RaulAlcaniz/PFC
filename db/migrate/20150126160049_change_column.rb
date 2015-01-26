class ChangeColumn < ActiveRecord::Migration
  def change
    change_column :exhibitions, :description, :string, :limit=> 5000
  end
end