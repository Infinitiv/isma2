class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.references :parent, index: true
      t.string :name
      t.boolean :administrator
      t.boolean :moderator
      t.boolean :writer
      t.boolean :reader
      t.boolean :commentator

      t.timestamps
    end
  end
end
