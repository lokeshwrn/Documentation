class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :title
      t.integer :parent_id
      t.boolean :status, :default => false
      t.string :author
      t.string :access
      t.string :controller
      t.string :action

      t.timestamps null: false
    end
  end
end
