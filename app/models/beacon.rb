class Beacon < ActiveRecord::Base
  belongs_to :business
  attr_accessible :major, :minor, :uuid, :business_id
  has_many :behaviors
  
  validates :business_id, :presence => true
  validates :major, :minor, :uuid, :presence => true
  validates_uniqueness_of :major, :scope => :minor
end