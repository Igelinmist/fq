class CreateGazAssays < ActiveRecord::Migration
  def change
    create_table :gaz_assays do |t|
      t.string :subdivision
      t.datetime :dttm
      t.float :ncv

      t.timestamps
    end
  end
end
