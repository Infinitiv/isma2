class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.references :article, index: true
      t.string :name
      t.string :mime_type
      t.binary :data
      t.binary :thumbnail

      t.timestamps
    end
  end
end
