require 'spec_helper'

describe SongsController do
  render_views

  let(:user) { User.create!(:name => "John Doe", :email => "john@doe.com", :password => "12345") }

  let(:post_params) { { :title => "New Post", :motivation => "Want to share", :user_id => user.id} }
  # let(:valid_post) { Post.create!(post_params) }

  # let(:comment_params) { { :body => "Test comment body", :user_id => user.id } }


  describe "GET search" do
      it "renders a song search page if given a valid search term" do
        get :search, :post => { :title => "Test Post", :motivation => "Test Post Motive", :song => "Freedom Call Land of Light" }
        expect(response.body).to include("Freedom Call - In Hellvetia - Land of Light")
      end

      # THIS WILL FAIL BECAUSE THIS FEATURE IS NYI FOR POSTS
      it "renders a 'Cannot post without a valid song' page if given no search term" do
        get :search, :post => {:title => "Test Post", :motivation => "Test Post Motive"}
        expect(response.body).to include("No songs were found that matched your search criteria. Try a different")
      end
  end

  describe "GET search_for_use_by_comment" do
      it "renders a song search page if given a valid search term" do
        new_song = Song.create!(:short_url => "https://rd.io/e/Qiu67tA/", :title => "We Are One")

        new_post_params = { :title => "New Post", :motivation => "Want to share", :user_id => user.id, :song_id => new_song.id}
        new_post = Post.create!(new_post_params)

        get :search_for_use_by_comment, { :post_id => new_post.id, :comment => { :body => "Test Comment Body", :song => "Freedom Call Land of Light" } }
        expect(response.body).to include("Freedom Call - In Hellvetia - Land of Light")
      end

      it "renders a 'do you wish to post a comment without adding a song' page if given no search term" do
        new_song = Song.create!(:short_url => "https://rd.io/e/Qiu67tA/", :title => "We Are One")

        new_post_params = { :title => "New Post", :motivation => "Want to share", :user_id => user.id, :song_id => new_song.id}
        new_post = Post.create!(new_post_params)

        get :search_for_use_by_comment, { :post_id => new_post.id, :comment => { :body => "Test Comment Body" } }
        expect(response.body).to include("No songs were found")
      end
  end


end
