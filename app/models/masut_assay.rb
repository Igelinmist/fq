class MasutAssay < ActiveRecord::Base
  validates_presence_of :dttm, :subdivision
  attr_accessible :ash, :density, :dttm, :flash_point, :moisture, :ncv, :sera, :subdivision
end
