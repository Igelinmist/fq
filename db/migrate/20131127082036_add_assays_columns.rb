class AddAssaysColumns < ActiveRecord::Migration
  def change
    add_column :coil_assays, :is_suplier_assay, :boolean, default: false
    add_column :coil_assays, :is_public_info, :boolean, default: false

    add_column :gaz_assays, :is_suplier_assay, :boolean, default: false
    add_column :gaz_assays, :is_public_info, :boolean, default: false

    add_column :masut_assays, :is_suplier_assay, :boolean, default: false
    add_column :masut_assays, :is_public_info, :boolean, default: false
  end

end
