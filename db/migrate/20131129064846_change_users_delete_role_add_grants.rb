class ChangeUsersDeleteRoleAddGrants < ActiveRecord::Migration
  def change
    remove_column :users, :role
    add_column :users, :grants, :integer, default: 0

  end

end
