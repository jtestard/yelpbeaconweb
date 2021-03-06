# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Businesses
username = 'jtestard'
password = '123'
password_salt = BCrypt::Engine.generate_salt()
password_hash = BCrypt::Engine.hash_secret(password, password_salt)
business = Business.create(yelp_username: username, password_hash: password_hash, password_salt: password_salt)

#Beacons
beacon1 = Beacon.create(business_id: business.id, uuid: 'B9407F30-F5F8-466E-AFF9-25556B57FE6D', biz_id: 'xsgVQ7QMslfYD4E8xQ7GNQ', biz_name: 'yelp cafe', biz_image: 'http://s3-media3.fl.yelpcdn.com/bphoto/nQK-6_vZMt5n88zsAS94ew/l.jpg', major: 0, minor: 4)
beacon2 = Beacon.create(business_id: business.id, uuid: 'B9407F30-F5F8-466E-AFF9-25556B57FE6D',  biz_id: 'xsgVQ7QMslfYD4E8xQ7GNQ', biz_name: 'yelp cafe', biz_image: 'http://s3-media3.fl.yelpcdn.com/bphoto/nQK-6_vZMt5n88zsAS94ew/l.jpg', major: 0, minor: 1)

#Behaviors
Behavior.create(beacon_id: beacon1.id, proximity: 'immediate', status: 'inside', action: 'yelp:///biz/add/check_in?biz_id=xsgVQ7QMslfYD4E8xQ7GNQ')
Behavior.create(beacon_id: beacon2.id, proximity: 'immediate', status: 'entering', action: 'http://www.yelp.com')
Behavior.create(beacon_id: beacon2.id, proximity: 'near', status: 'entering', action: 'http://www.yelp.com')