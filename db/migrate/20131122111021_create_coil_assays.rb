class CreateCoilAssays < ActiveRecord::Migration
  def change
    create_table :coil_assays do |t|
      t.string :subdivision
      t.datetime :dttm
      t.string :route
      t.float :moisture
      t.float :wf_ash
      t.float :df_ash
      t.float :letuch
      t.float :sera
      t.float :ncv

      t.timestamps
    end
  end
end
