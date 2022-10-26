# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "DELETING DATABASE..."
User.delete_all
Song.delete_all
Tag.delete_all
SongTag.delete_all
Comment.delete_all
Favorite.delete_all

puts "CREATING TEST USERS..."
u1 = User.create!({
  username: "rothberry",
  password: "123",
  bio: "wooooooooooooooo",
  name: "phil",
  location: "Monterey",
  fb_url: Faker::Internet.url(host: "facebook.com"),
  sc_url: Faker::Internet.url(host: "soundcloud.com"),
  tw_url: Faker::Internet.url(host: "twitter.com"),
})
u2 = User.create!({
  username: "strawberry",
  password: "123",
  bio: "noooooooooooooo",
  name: "not phil",
  location: "Monterey",
  fb_url: Faker::Internet.url(host: "facebook.com"),
  sc_url: Faker::Internet.url(host: "soundcloud.com"),
  tw_url: Faker::Internet.url(host: "twitter.com"),
})
u3 = User.create!({
  username: "rawberry",
  password: "123",
  bio: "wooooooooooooooo",
  name: "def not phil",
  location: "Monterey",
  fb_url: Faker::Internet.url(host: "facebook.com"),
  sc_url: Faker::Internet.url(host: "soundcloud.com"),
  tw_url: Faker::Internet.url(host: "twitter.com"),
})

puts "CREATING USERS..."
num_users = 10
num_users.times do
  User.create!({
    username: Faker::Internet.username,
    password: "123",
    bio: Faker::Quote.famous_last_words,
    name: Faker::Name.first_name,
    location: Faker::Address.city,
    fb_url: Faker::Internet.url(host: "facebook.com"),
    sc_url: Faker::Internet.url(host: "soundcloud.com"),
    tw_url: Faker::Internet.url(host: "twitter.com"),  
  })
end


puts "CREATING TAGS..."
tag_arr = %w(ableton loop one_shot wip reaper fl_studio pro_tools synth sample drum_loop field_sample edit live logic cubase push massive sylenth analog wobble dub)
tag_arr.each do |tag|
  Tag.create(name: tag)  
end

puts "CREATING TEST SONGS..."

s1 = u1.songs.create!({title: "first no audio",description: "first no audio"})
s2 = u1.songs.create!({title: "second no audio",description: "second no audio"})
s3 = u1.songs.create!({title: "third no audio",description: "third no audio"})
s4 = u2.songs.create!({title: "wow no audio",description: "first no audio"})

puts "ASSIGNING TAGS TO SONGS..."
s1.song_tags.create!(tag: Tag.all.sample)
s1.song_tags.create!(tag: Tag.all.sample)
s2.song_tags.create!(tag: Tag.all.sample)
s2.song_tags.create!(tag: Tag.all.sample)
s3.song_tags.create!(tag: Tag.all.sample)
s4.song_tags.create!(tag: Tag.all.sample)
s4.song_tags.create!(tag: Tag.all.sample)

puts "CREATING TEST COMMENTS..."
s1.comments.create!(content: Faker::Lorem.sentence, user: User.all.sample)
s1.comments.create!(content: Faker::Lorem.sentence, user: User.all.sample)
s1.comments.create!(content: Faker::Lorem.sentence, user: User.all.sample)
s2.comments.create!(content: Faker::Lorem.sentence, user: User.all.sample)
s2.comments.create!(content: Faker::Lorem.sentence, user: User.all.sample)
s3.comments.create!(content: Faker::Lorem.sentence, user: User.all.sample)

puts "CREATING TEST FAVORITES..."
s1.favorites.create!(user: User.all.sample)
s1.favorites.create!(user: User.all.sample)
s1.favorites.create!(user: User.all.sample)
s2.favorites.create!(user: User.all.sample)
s2.favorites.create!(user: User.all.sample)
s3.favorites.create!(user: User.all.sample)

puts "🎶 DONE 🎶"