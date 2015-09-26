class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :email
      t.string :password_hash
      t.string :password_salt
      t.string :role, :default => "users"
      t.boolean :status, :default => false

      t.timestamps null: false
    end
  end
end
