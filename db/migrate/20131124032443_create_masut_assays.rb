class CreateMasutAssays < ActiveRecord::Migration
  def change
    create_table :masut_assays do |t|
      t.string :subdivision
      t.datetime :dttm
      t.float :density
      t.float :moisture
      t.float :sera
      t.float :flash_point
      t.float :ash
      t.float :ncv

      t.timestamps
    end
  end
end
