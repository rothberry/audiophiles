class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :name, :location, :bio, :fb_url, :tw_url, :sc_url
  # For the show or single user routes
  has_many :songs
  # ? Prob don't need all the user's comments and favorites here
  # has_many :comments
  # has_many :favorites

end
