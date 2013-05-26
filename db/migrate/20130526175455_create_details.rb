class CreateDetails < ActiveRecord::Migration
  def change
    create_table :details do |t|
      t.string :key
      t.string :value

      t.timestamps
    end
  end
end
