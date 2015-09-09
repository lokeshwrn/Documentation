class ChangeColumnNameInMenu < ActiveRecord::Migration
  def change
    rename_column :menus, :author, :alias_name
  end
end
