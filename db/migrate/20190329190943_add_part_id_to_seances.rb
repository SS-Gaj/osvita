class AddPartIdToSeances < ActiveRecord::Migration[5.2]
  def change
    add_column :seances, :part_id, :integer
  end
end
