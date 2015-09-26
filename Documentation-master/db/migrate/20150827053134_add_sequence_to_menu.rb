class AddSequenceToMenu < ActiveRecord::Migration
  def change
    add_column :menus, :sequence_number, :string
  end
end
