class CoilAssay < ActiveRecord::Base
  validates_presence_of :dttm, :subdivision
  attr_accessible :df_ash, :dttm, :letuch, :moisture, :ncv, :route, :sera, :subdivision, :wf_ash
end
