class User < ApplicationRecord
  validates :name, uniqueness: true
  validates :name, :photo, presence: true
  validates :name, :photo, :bio, length: { minimum: 5 }
  has_many :comments
  has_many :posts
  has_many :likes

  def show_recent
    posts.order(created_at: :desc).limit(3)
  end
end
