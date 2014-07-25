class Beacon < ActiveRecord::Base
  belongs_to :business
  attr_accessible :major, :minor, :uuid
  has_many :behaviors
  
  validates :major, :minor, :uuid, :business_id, :presence => true
  validates_uniqueness_of :major, :scope => :minor
end