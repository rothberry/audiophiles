class UserIndexSerializer < ActiveModel::Serializer
  attributes :id, :username, :name, :location, :bio, :fb_url, :tw_url, :sc_url
end
