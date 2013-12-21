class Song < ActiveRecord::Base
  attr_accessible :short_url, :title, :artist, :album, :year
  has_many :posts
  has_many :comments
end
