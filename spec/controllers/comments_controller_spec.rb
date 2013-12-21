require 'spec_helper'

describe CommentsController do
  let(:user) { User.create!(:name => "John Doe", :email => "john@doe.com", :password => "12345") }
  let(:post_params) { { :title => "New Post", :motivation => "Want to share", :user_id => user.id, :song_id => song.id } }
  let(:valid_post) { Post.new(post_params) }



  describe "POST create" do
      it "adds a comment to the database if it is valid" do
        user = User.create!(:name => "John Doe", :email => "john@doe.com", :password => "12345")
        song = Song.create!(:short_url => "https://rd.io/e/Qiu67tA/", :title => "We Are One")
        valid_post = Post.create!({ :title => "New Post", :motivation => "Want to share", :user_id => user.id, :song_id => song.id })

        custom_params = {
          :song_embed_url => song.short_url,
          :song_title => song.title,
          :song_artist => song.artist,
          :song_album => song.album,
          :post_id => valid_post.id,
          :comment_body => "This is a test comment"
        }
        session[:current_user_id] = user.id

        expect{
          post :create, custom_params
        }.to change(Comment, :count).by(1)

      end
  end


end
