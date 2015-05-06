# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



tv_shows = Category.create(name: "Comedy")

8.times do |index|
  Video.create(title: "Family Guy #{index + 1}",
               description: "Family Guy Info",
               small_cover_url: "/tmp/family_guy.jpg",
               large_cover_url: "http://dummyimage.com/665x375/000000/00a2ff",
               category_id: 1)
end

tv_shows = Category.create(name: "Sci-Fi")

8.times do |index|
  Video.create(title: "Futurama #{index + 1}",
               description: "Futurama Info",
               small_cover_url: "/tmp/futurama.jpg",
               large_cover_url: "http://dummyimage.com/665x375/000000/00a2ff",
               category_id: 2)
end