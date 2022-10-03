class SongTagSerializer < ActiveModel::Serializer
  attributes :id
  has_one :song
  has_one :tag
end
