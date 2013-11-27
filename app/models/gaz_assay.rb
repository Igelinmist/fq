class GazAssay < ActiveRecord::Base
  validates_presence_of :dttm, :subdivision
  attr_accessible :dttm, :ncv, :subdivision
end
