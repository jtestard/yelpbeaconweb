class Beacon < ActiveRecord::Base
  attr_accessible :major, :minor
  has_many :behaviors
  
  validates :major, :minor, :presence => true
  validates_uniqueness_of :major, :scope => :minor
end