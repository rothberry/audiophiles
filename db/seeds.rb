# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "DELETING DATABASE...\n"
User.delete_all
Song.delete_all
Tag.delete_all
SongTag.delete_all
Comment.delete_all
Favorite.delete_all

puts "CREATING USERS...\N"
user_params = {
  username: "rothberry",
  password: "123",
  bio: "wooooooooooooooo",
  name: "phil",
  location: "Monterey",
  fb_url: Faker::Internet.url(host: "facebook.com"),
  sc_url: Faker::Internet.url(host: "soundcloud.com"),
  tw_url: Faker::Internet.url(host: "twitter.com"),

}
u1 = User.create!(user_params)



puts "CREATING TAGS...\N"
tag_arr = %w(ableton loop one_shot wip reaper fl_studio pro_tools synth sample drum_loop field_sample edit live logic cubase push massive sylenth analog wobble dub)
tag_arr.each do |tag|
  Tag.create(name: tag)  
end

puts "CREATING USERS...\N"
puts "CREATING USERS...\N"
puts "CREATING USERS...\N"

puts "🎶 DONE 🎶"