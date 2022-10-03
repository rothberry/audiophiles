class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :password_digest, :name, :location, :bio, :fb_url, :tw_url, :sc_url
end
