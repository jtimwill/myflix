# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

comedies = Category.create(name: "Comedies")
dramas = Category.create(name: "Dramas")

10.times do |index|
  Video.create(title: "Family Guy #{index + 1}",
               description: "Family Guy Info",
               small_cover_url: "/tmp/family_guy.jpg",
               large_cover_url: "http://dummyimage.com/665x375/000000/00a2ff",
               category: comedies)
end

10.times do |index|
  Video.create(title: "Futurama #{index + 1}",
               description: "Futurama Info",
               small_cover_url: "/tmp/futurama.jpg",
               large_cover_url: "http://dummyimage.com/665x375/000000/00a2ff",
               category: dramas)
end


kevin = User.create(full_name: "Kevin Wang", password: "password", email: "kevin@example.com")

Review.create(user: kevin, video: Video.first, rating: 3, content: "This movie is average")
Review.create(user: kevin, video: Video.first, rating: 1, content: "This movie is trash") 
