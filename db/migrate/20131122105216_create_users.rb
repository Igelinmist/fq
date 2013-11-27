class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login
      t.string :password_digest
      t.string :surname
      t.string :name
      t.string :subdivision
      t.string :role
      t.integer :login_count
      t.string :last_login

      t.timestamps
    end
  end
end
