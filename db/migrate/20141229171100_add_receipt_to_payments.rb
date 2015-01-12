class AddReceiptToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :receipt, :string
  end
end
