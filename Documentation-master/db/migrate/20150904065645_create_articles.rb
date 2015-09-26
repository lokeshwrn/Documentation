class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :description
      t.text :content
      t.integer :user_id
      t.boolean :status, :default => false
      t.string :reference_url, :default => nil
      t.string :github_url, :default => nil
      t.integer :comments_count, :default => 0
      t.integer :rating, :default => 0

      t.timestamps null: false
    end
  end
end
