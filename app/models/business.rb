class Business < ActiveRecord::Base
  has_many :beacons
  attr_accessible :yelp_username, :password_hash, :password_salt, :biz_id
  
  before_save :encrypt_password
  validates_uniqueness_of :yelp_username, :biz_id
  validates_presence_of :password_hash, :yelp_username, :password_salt
  
  attr_accessor :password
  before_save :encrypt_password
  
  def self.authenticate(yelp_username, password)
    business = find_by_yelp_username(yelp_username)
    if business && business.password_hash == BCrypt::Engine.hash_secret(password, business.password_salt)
      business
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
