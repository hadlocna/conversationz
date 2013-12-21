require 'spec_helper'

# describe the controller
  # describe a method
    # describe what it does

describe UsersController do
  let(:user) { User.create(:name => "John Doe", :email => "john@doe.com", :password => "12345") }

  
  describe "#create_login" do
      it "finds a user by email" do
        User.find_by_email(user.email).should eq user
      end

      it "returns nil if no user found" do
        expect User.find_by_email("noemail@email.com").should eq nil
      end

      it "authenticates a matching users password" do
        user.authenticate(user.password).should eq user
      end

      it "does not authenticate a non-matching user password" do
        user.authenticate("notpassword").should eq false
      end
  end


end
