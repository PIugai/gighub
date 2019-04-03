require 'faker'
require 'date'

# Create 50 users in order to create 50 bands, since each band must have a user (band has user as a foreign ID)
20.times do
  User.create(name: Faker::Name.name, email: Faker::Internet.email, photo: "http://loremflickr.com/200/200/faceshot")
end

# BAND ATTRIBUTES:

# name
# photo
# location
# price
# description
# link
# user_id

counter = 0

User.all.each do |user|
  name1 = Faker::Kpop.i_groups
  name2 = Faker::Music::RockBand.name
  bandname = [name1, name2].sample
  photoURL = "http://loremflickr.com/300/#{150+counter}/rockband"
  counter += 1
  city = %w(Shanghai Beijing Shenzhen Chengdu Hangzhou Nanjing Chongqing).sample
  randomcost = [100, 120, 150, 199, 250, 280, 500, 800, 1500, 2000, 10000].sample
  lorem = Faker::Lorem.paragraph(rand(2..4))
  randomlinks = "https://v.youku.com/v_show/id_XODMzNDcwMzM2.html"
  randomstyle = %w(Rock Rap Ska Trip-hop Reggae Gospel Bhangra Pop Jazz).sample
  # every band has the same video for now... unless we have time to seed more variety
  new_band = Band.create(name: bandname, photo: photoURL, location: city, price: randomcost, description: lorem, link: randomlinks, user: user, style: randomstyle)
end

20.times do
  Booking.create(user_id: User.all.sample.id, band_id: Band.all.sample.id, date: Date.today)
end

p "#{User.count} users have been seeded to database"
p "#{Band.count} bands have been seeded to database"
p "#{Booking.count} bookings have been seeded to database"
