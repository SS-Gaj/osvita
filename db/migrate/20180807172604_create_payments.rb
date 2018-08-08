class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.string :kvit_num
      t.datetime :date_at
      t.money :suma
      t.string :content
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
