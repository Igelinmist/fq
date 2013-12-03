class ChangeLastUserLoginTypeToTimestamp < ActiveRecord::Migration
  def up
    remove_column :users, :last_login
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
