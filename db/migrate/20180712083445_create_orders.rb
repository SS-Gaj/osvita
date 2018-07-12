class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :id_user
      t.integer :order_num
      t.date :date_at
      t.date :date_end
      t.string :content

      t.timestamps
    end
  add_index :orders, [:id_user, :created_at]
  end
end
