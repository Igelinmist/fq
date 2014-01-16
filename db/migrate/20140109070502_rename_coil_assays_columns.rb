class RenameCoilAssaysColumns < ActiveRecord::Migration
  def change
    rename_column :coil_assays, :moisture, :w_r_t
    rename_column :coil_assays,:wf_ash, :a_r
    rename_column :coil_assays,:df_ash, :a_d
    rename_column :coil_assays,:letuch, :v_daf
    rename_column :coil_assays,:sera, :s_a
    rename_column :coil_assays, :ncv, :q_r_i

    add_column :coil_assays, :w_a, :float
    add_column :coil_assays, :a_a, :float
    add_column :coil_assays, :q_a_b, :float
    add_column :coil_assays, :q_d_s, :float
    add_column :coil_assays, :q_daf_s, :float
    add_column :coil_assays, :v_a, :float
    add_column :coil_assays, :h_a, :float
    add_column :coil_assays, :protocol_num, :integer
    add_column :coil_assays, :coil_class, :string
    add_column :coil_assays, :supplier, :string
  end

end
