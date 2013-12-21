require 'spec_helper'

describe PostsController do
  render_views

  let(:song_params) { { :title => "White Christmas", :artist => "Bing Crosby", :album => "Holiday Inn", :year => 1941, :short_url => "http://www.placeholder.com"  } }
  let(:song) { Song.create!(song_params) }

  let(:post_params) { { :title => "New Post", :motivation => "Want to share", :user_id => 1, :song_id => song.id } }
  let(:valid_post) { Post.new(post_params) }

  describe "GET new" do
    it "should render the new post form" do
      get :new
      expect(response.body).to include("Share a song")
    end
  end

  describe "POST create" do
    # let(:song_params) { { :title => "White Christmas", :artist => "Bing Crosby", :album => "Holiday Inn", :year => 1941, :song_embed_url => "http://www.placeholder.com"  } }
    # let(:song) { Song.create!(song_params) }
    let(:custom_params) {
      {
        :song_title => "White Christmas",
        :song_artist => "Bing Crosby",
        :song_album => "Holiday Inn",
        :song_embed_url => "http://www.placeholder.com",
        :post_title => valid_post.title,
        :post_motivation => valid_post.motivation
      }
    }

    let(:user) { User.create!(:name => "Me", :email => "me123@youabc.com", :password => "123") }

    it "should add a new post to the database" do
      session[:current_user_id] = user.id

      expect{
        post :create, custom_params
      }.to change(Post, :count).by(1)
    end
  end

  describe "GET show" do
    let(:song_params) { { :title => "White Christmas", :artist => "Bing Crosby", :album => "Holiday Inn", :year => 1941, :short_url => "http://www.placeholder.com"  } }
    let(:song) { Song.create!(song_params) }

    let(:user) { User.create!(:name => "Me", :email => "me123@youabc.com", :password => "123") }
    let(:new_post) { Post.create!(:title => "Test Post for GET show", :motivation => "Test Post Body", :user_id => user.id, :song_id => song.id) }

    it "should render the correct post" do
      session[:current_user_id] = user.id

      get :show, :id => new_post.id
      expect(response.body).to include("#{new_post.title}")
    end
  end

  describe "#search" do
    it "renders results for 'et'" do
      get :search, :post => { :search => "et" }
      expect(response.body).to include("Posts containing et")
    end
  end
end
