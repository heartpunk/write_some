class AddOwnerToScribbles < ActiveRecord::Migration
  def change
    add_column :scribbles, :owner_id, :integer
    add_index :scribbles, :owner_id
  end
end
