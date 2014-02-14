class AddGazMazutProtocolNum < ActiveRecord::Migration
  def change
    add_column :gaz_assays, :protocol_num, :integer
    add_column :masut_assays, :protocol_num, :integer
  end
end
