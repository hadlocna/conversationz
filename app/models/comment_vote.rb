class CommentVote < ActiveRecord::Base
  attr_accessible :user_id, :comment_id, :is_up_vote
  belongs_to :comment
  belongs_to :user
end
