class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.references :user, index: true
      t.string :title
      t.text :content
      t.date :exp_date
      t.boolean :published, :default => false
      t.boolean :fixed
      t.boolean :commentable, :default => false
      t.references :division, index: true
      t.references :group, index: true
      t.references :article_type, index: true

      t.timestamps
    end
  end
end
