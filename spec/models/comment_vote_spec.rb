require 'spec_helper'

describe CommentVote do
  let(:user) { User.create(:name => "John Doe", :email => "john@doe.com", :password => "12345") }

  let(:post_params) { { :title => "New Post", :motivation => "Want to share", :user_id => user.id, :song_id => 1 } }
  let(:post) { Post.create(post_params) }

  let(:comment_params) { { :body => "Comment body is here.", :song_id => 1, :user_id => user.id, :post_id => post.id } }
  let(:comment) { Comment.create(comment_params) }

  let(:comment_vote_params) { { :is_up_vote => true, :comment_id => comment.id, :user_id => user.id } }
  let(:comment_vote) { CommentVote.new(comment_vote_params) }

  context "#initialize" do
    it "instantiates a comment_vote" do
      comment_vote.should be_an_instance_of(CommentVote)
    end
  end

  context "#save" do

    it "valid comment_votes with a true is_up_vote can be saved successfully" do
      comment_vote.save!

      CommentVote.find(comment_vote.id).should be_an_instance_of CommentVote
    end

    it "valid comment_votes with a false is_up_vote can be saved successfully" do
      comment_vote.is_up_vote = false
      comment_vote.save!

      CommentVote.find(comment_vote.id).should be_an_instance_of CommentVote
    end

    it "will not allow a null user_id" do
      comment_vote.user_id = nil
      expect { comment_vote.save! }.to raise_error(ActiveRecord::StatementInvalid)
    end

    it "will not allow a null comment_id" do
      comment_vote.comment_id = nil
      expect { comment_vote.save! }.to raise_error(ActiveRecord::StatementInvalid)
    end

    it "will not allow a null is_up_vote" do
      comment_vote.is_up_vote = nil
      expect { comment_vote.save! }.to raise_error(ActiveRecord::StatementInvalid)
    end



  end

  it { should allow_mass_assignment_of(:is_up_vote) }
  it { should allow_mass_assignment_of(:comment_id) }
  it { should allow_mass_assignment_of(:user_id) }

end
