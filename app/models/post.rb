class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :user

  def update_counter(id)
    user = User.find_by(id: id)
    user.posts_counter += 1
    user.save
  end

  def show_recent(id)
    Comment.where("post_id = ?", id).limit(5).order(created_at: :desc)
  end
end
