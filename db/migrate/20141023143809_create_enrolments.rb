class CreateEnrolments < ActiveRecord::Migration
  def change
    create_table :enrolments do |t|
      t.integer :dog_id
      t.integer :exhibition_id
      t.integer :payment_id
      t.float :price

      t.timestamps
    end
  end
end
