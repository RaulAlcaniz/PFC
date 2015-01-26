class AddImageToExhibitions < ActiveRecord::Migration
  def change
    add_column :exhibitions, :image, :string
  end
end
