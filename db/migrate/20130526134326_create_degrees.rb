class CreateDegrees < ActiveRecord::Migration
  def change
    create_table :degrees do |t|
      t.string :name
      t.string :short_name

      t.timestamps
    end
  end
end
