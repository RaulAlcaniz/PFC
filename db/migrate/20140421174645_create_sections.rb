class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.integer :group_id
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
