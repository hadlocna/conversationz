require 'spec_helper'

describe Post do
  let(:user) { User.create(:name => "John Doe", :email => "john@doe.com", :password => "12345") }

  let(:params) { { :title => "New Post", :motivation => "Want to share", :user_id => user.id, :song_id => 1 } }
  let(:post) { Post.new(params)}

  context "#initialize" do
    it "instantiates a post" do
      post.should be_an_instance_of(Post)
    end
  end

  context "#save" do

    it "valid posts can be saved successfully" do
      post.save!

      Post.find(post.id).should be_an_instance_of Post
    end

    it "will not allow a null title" do
      post.title = nil
      expect { post.save! }.to raise_error(ActiveRecord::StatementInvalid)
    end

    it "will not allow a null user_id" do
      post.user_id = nil
      expect { post.save! }.to raise_error(ActiveRecord::StatementInvalid)
    end

    it "will not allow a null song_id" do
      post.song_id = nil
      expect { post.save! }.to raise_error(ActiveRecord::StatementInvalid)
    end

    it "will allow a null motivation" do
      post.motivation = nil
      expect { post.save! }.to_not raise_error(ActiveRecord::StatementInvalid)
    end

  end

  it { should allow_mass_assignment_of(:title) }
  it { should allow_mass_assignment_of(:motivation) }
  it { should allow_mass_assignment_of(:user_id) }
  it { should allow_mass_assignment_of(:song_id) }


end
