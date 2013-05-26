class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references :user, index: true
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.references :degree, index: true
      t.references :academic_title, index: true
      t.string :email
      t.string :phone
      t.binary :avatar

      t.timestamps
    end
  end
end
