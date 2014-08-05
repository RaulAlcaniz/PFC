class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.date :date_of_birth
      t.string :sex
      t.string :country

      t.timestamps
    end
  end
end
