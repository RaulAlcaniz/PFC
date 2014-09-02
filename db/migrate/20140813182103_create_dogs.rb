class CreateDogs < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :titles
      t.string :sire
      t.string :dam
      t.string :sex
      t.date :date_of_birth
      t.references :dogable, index: true, polymorphic: true
      t.integer :person_id

      t.timestamps
    end
  end
end
