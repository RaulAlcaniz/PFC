class CreateSubsections < ActiveRecord::Migration
  def change
    create_table :subsections do |t|
      t.integer :section_id
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
