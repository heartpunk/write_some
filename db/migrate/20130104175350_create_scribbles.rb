class CreateScribbles < ActiveRecord::Migration
  def change
    create_table :scribbles do |t|
      t.timestamps
    end
  end
end
