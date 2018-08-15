class CreateParts < ActiveRecord::Migration[5.2]
  def change
    create_table :parts do |t|
      t.string :part
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
