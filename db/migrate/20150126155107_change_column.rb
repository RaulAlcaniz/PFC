class ChangeColumn < ActiveRecord::Migration
  def change
    change_column :exhibitions, :description, :string, :limit=> 1000
  end
end
