class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.datetime :dttm
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
