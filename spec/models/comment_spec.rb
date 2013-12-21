require 'spec_helper'

describe Comment do
  let(:user) { User.create(:name => "John Doe", :email => "john@doe.com", :password => "12345") }

  let(:post_params) { { :title => "New Post", :motivation => "Want to share", :user_id => user.id, :song_id => 1 } }
  let(:post) { Post.create(post_params) }

  let(:comment_params) { { :body => "Comment body is here.", :song_id => 1, :user_id => user.id, :post_id => post.id } }
  let(:comment) { Comment.new(comment_params) }

  context "#initialize" do
    it "instantiates a comment" do
      comment.should be_an_instance_of(Comment)
    end
  end

  context "#save" do

    it "valid comments can be saved successfully" do
      comment.save!

      Comment.find(comment.id).should be_an_instance_of Comment
    end

    it "will not allow a null user_id" do
      comment.user_id = nil
      expect { comment.save! }.to raise_error(ActiveRecord::StatementInvalid)
    end

    it "will not allow a null post_id" do
      comment.post_id = nil
      expect { comment.save! }.to raise_error(ActiveRecord::StatementInvalid)
    end

    it "will allow a null body" do
      comment.body = nil
      expect { post.save! }.to_not raise_error(ActiveRecord::StatementInvalid)
    end

    it "will allow a null song_id" do
      comment.song_id = nil
      expect { post.save! }.to_not raise_error(ActiveRecord::StatementInvalid)
    end

  end

  it { should allow_mass_assignment_of(:body) }
  it { should allow_mass_assignment_of(:post_id) }
  it { should allow_mass_assignment_of(:user_id) }
  it { should allow_mass_assignment_of(:song_id) }



end
