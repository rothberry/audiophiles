class Song < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :song_tags, dependent: :destroy
  has_many :tags, through: :song_tags
  belongs_to :user

  has_one_attached :song_link

end
