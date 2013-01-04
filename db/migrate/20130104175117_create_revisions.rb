class CreateRevisions < ActiveRecord::Migration
  def change
    create_table :revisions do |t|
      t.integer :scribble_id
      t.text :text

      t.timestamps
    end
  end
end
