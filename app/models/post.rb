class Post < ActiveRecord::Base
  attr_accessible :title, :motivation, :user_id, :song_id

  belongs_to :user
  belongs_to :song
  has_many :comments
end
