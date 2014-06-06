class CreateBreeds < ActiveRecord::Migration
  def change
    create_table :breeds do |t|
      t.string :name
      t.references :breedable, polymorphic: true

      t.timestamps
    end
  end
end
