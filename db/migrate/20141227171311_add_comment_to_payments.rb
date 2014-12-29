class AddCommentToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :comment, :string
  end
end
