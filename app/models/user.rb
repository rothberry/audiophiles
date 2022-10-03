class User < ApplicationRecord
  has_secure_password

  has_many :songs, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_one_attached :image_link

  validates :username, uniqueness: true, presence: true, length: { minimum: 3, maximum: 20 }
  validates :name, :location, :bio, presence: true
end
