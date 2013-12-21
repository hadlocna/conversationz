class User < ActiveRecord::Base
  attr_accessible :name, :email, :password
  has_many :projects
  has_many :words, :through => :projects

  validates :email, :uniqueness => true
  validates :email, :format => /.+\@.+\..{2,6}/

  has_secure_password
end
