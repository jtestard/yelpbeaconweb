class Behavior < ActiveRecord::Base
  belongs_to :beacon
  attr_accessible :proximity, :status, :action, :beacon_id
  
  validates_presence_of :proximity, :status, :action, :beacon_id
end
