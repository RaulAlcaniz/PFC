class CreateVarieties < ActiveRecord::Migration
  def change
    create_table :varieties do |t|
      t.string :name
      t.integer :breed_id

      t.timestamps
    end
  end
end
