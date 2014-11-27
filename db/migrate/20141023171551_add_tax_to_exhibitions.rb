class AddTaxToExhibitions < ActiveRecord::Migration
  def change
    add_column :exhibitions, :tax, :text
  end
end
