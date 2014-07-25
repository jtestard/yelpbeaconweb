class Beacon < ActiveRecord::Base
  attr_accessible :major, :minor, :uuid
  has_many :behaviors
  
  validates :major, :minor, :uuid, :presence => true
  validates_uniqueness_of :major, :scope => :minor
end