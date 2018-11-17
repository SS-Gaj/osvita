class AddLectureToParts < ActiveRecord::Migration[5.2]
  def change
    add_column :parts, :lecture, :string
  end
end
