class Comment < ActiveRecord::Base
  attr_accessible :user_id, :post_id, :song_id, :body
  belongs_to :user
  belongs_to :post
  belongs_to :song
  has_many :comment_votes
end
