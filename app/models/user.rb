class User < ApplicationRecord
  has_many :comments
  has_many :posts
  has_many :likes

  def show_recent(id)
    Post.where("user_id = ?", id).limit(3).order(created_at: :desc)
  end
end
