class CreateDivisions < ActiveRecord::Migration
  def change
    create_table :divisions do |t|
      t.string :name
      t.references :division_type, index: true
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
