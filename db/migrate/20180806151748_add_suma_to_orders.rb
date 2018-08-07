class AddSumaToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :suma, :money
    add_reference :orders, :profile, foreign_key: true
    remove_index :orders, [:id_user, :created_at]
  end
end
