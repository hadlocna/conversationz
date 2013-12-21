require 'spec_helper'

describe MyPostsController do
  render_views

  describe "GET index" do

    let(:user_params) { { :name => "Kent", :email => "kent@wins.com", :password => "password" } }
    let(:user) { User.new(user_params) }

    it "displays the list of posts created by the current user" do
      user.save!
      session[:current_user_id] = user.id

      post_params = { :title => "Rspec Test Post 13-37", :motivation => "Want to test controller", :song_id => 1 }
      user.posts.create!(post_params)


      get :index
      expect(response.body).to include(">Rspec Test Post 13-37</a>")
    end
  end
end
