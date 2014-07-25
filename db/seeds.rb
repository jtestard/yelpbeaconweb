# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Beacons
beacon1 = Beacon.create(major: 0, minor: 0)
beacon2 = Beacon.create(major: 0, minor: 1)

Behavior.create(beacon_id: beacon1.id, proximity: 'near', status: 'entering', action: 'http://www.yelp.com')
Behavior.create(beacon_id: beacon1.id, proximity: 'immediate', status: 'entering', action: 'http://www.yelp.com')
Behavior.create(beacon_id: beacon2.id, proximity: 'near', status: 'entering', action: 'http://www.yelp.com')
