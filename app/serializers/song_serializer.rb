class SongSerializer < ActiveModel::Serializer
  attributes :id, :title, :description
  has_one :user
  has_many :tags
  has_many :favorites
  has_many :comments
end
