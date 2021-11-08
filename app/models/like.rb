class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post
  after_save :update_counter

  private

  def update_counter(id)
    post.increment!(:likes_counter)
  end
end
