class Post < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'

  has_many :comments, class_name: 'Comment', foreign_key: 'user_id'
  has_many :likes, class_name: 'Like', foreign_key: 'user_id'

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :update_posts

  def update_posts
    user.increment!(:posts_counter)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
