require 'spec_helper'

feature "User logs out" do
  scenario "when logging out" do
    user = User.create(name: 'fred', email: "skylar@corkerykaulke.org", password: 'jams')
    visit "/login"
    fill_in "Email", :with => "skylar@corkerykaulke.org"
    fill_in "Password", :with => "jams"
    click_button "login"
    visit "/"
    click_button "logout"
    visit "/"
    expect(page).to have_text("Sign Up")
    
  end
end

