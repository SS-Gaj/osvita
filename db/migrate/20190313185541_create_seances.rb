class CreateSeances < ActiveRecord::Migration[5.2]
  def change
    create_table :seances do |t|
      t.integer :quest1
      t.integer :quest2
      t.integer :quest3
      t.integer :quest4
      t.integer :quest5
      t.integer :quest6
      t.integer :quest7
      t.integer :quest8
      t.integer :quest9
      t.integer :quest10
      t.string :be_quests
      t.string :answ1
      t.string :answ2
      t.string :answ3
      t.string :answ4
      t.string :answ5
      t.string :answ6
      t.string :answ7
      t.string :answ8
      t.string :answ9
      t.string :answ10
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
