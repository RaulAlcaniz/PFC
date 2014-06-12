class CreateSubvarieties < ActiveRecord::Migration
  def change
    create_table :subvarieties do |t|
      t.string :name
      t.integer :variety_id

      t.timestamps
    end
  end
end
