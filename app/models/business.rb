class Business < ActiveRecord::Base
  attr_accessible :beacon_id, :business_id
  
  validates_presence_of :beacon_id, :business_id
end
