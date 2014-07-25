class Beacon < ActiveRecord::Base
  belongs_to :business
  attr_accessible :major, :minor, :uuid, :business_id, :biz_id, :biz_image, :biz_name
  has_many :behaviors
  
  validates :business_id, :presence => true
  validates :major, :minor, :uuid, :biz_id, :biz_name, :presence => true
  validates_uniqueness_of :major, :scope => :minor
end