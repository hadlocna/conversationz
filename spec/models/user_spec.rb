require 'spec_helper'

describe User do
  let(:user) { User.new(:name => "John Doe", :email => "john@doe.com", :password => "12345") }

  context "#initialize" do
    it "can be instantiated" do
      user.should be_an_instance_of(User)
    end

  end

  context "#save" do
    it "can be saved successfully" do
      user.save

      User.find_by_email("john@doe.com").should be_an_instance_of User
    end

    it "will not allow a null name" do
      user.name = nil
      expect { user.save! }.to raise_error(ActiveRecord::StatementInvalid)
    end

    it "will not allow a null email" do
      user.email = nil
      expect { user.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "will not allow a duplicate email" do
      user.save!
      user_2 = User.new(:name => "Johnathan Doe", :email => "john@doe.com", :password => "abcde")
      expect { user_2.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "will not store a plaintext password" do
      user.save!
      user.reload
      user.password_digest.should_not == "12345"
    end
  end

  context "#posts_commented_on" do
    it "will return all posts this user has commented on" do
      user.save!
      user_2 = User.create!(:name => "Other User", :email => "other@user.com", :password => "123")
      test_post = user_2.posts.create!(:title => "Commented on test post", :motivation => "Test posts_commented_on post", :song_id => 1)

      test_post.comments.create!(:body => "This should be the only result", :post_id => test_post.id, :user_id => user.id)

      user.posts_commented_on.should eq [test_post]
    end

  end

  it { should allow_mass_assignment_of(:password) }
  it { should allow_mass_assignment_of(:name) }
  it { should allow_mass_assignment_of(:email) }

end
