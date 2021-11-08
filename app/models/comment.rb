class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_counter(id)
    post = Post.find_by(id: id)
    post.comments_counter += 1
    post.save
  end
end
