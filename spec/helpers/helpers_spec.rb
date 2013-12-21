require 'spec_helper'

describe ControllerHelper do
  let(:user) { User.create(:name => "John Doe", :email => "john@doe.com", :password => "12345") }

  describe "#create" do
    # let(:user) { User.create(:name => "John Doe", :email => "john@doe.com", :password => "12345") }
    it "creates a user session" do
      helper.current_user_assign(user)
      expect(session[:current_user_id]).to eq User.find_by_email(user.email).id
    end
  end

  describe "#logout" do
    it "deletes a user session" do 
      helper.current_user_assign(user)
      helper.logout_user
      session[:current_user_id].should be_nil
    end
  end

  describe "get current_user" do 
    it "gets current user" do 
      helper.current_user_assign(user)
      helper.current_user.should eq user
    end
  end




end
