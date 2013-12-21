require 'spec_helper'

feature "User logs in" do
  user = User.create(name: 'fred', email: "skylar@corkerykaulke.org", password: 'jams')

  scenario "when logging in with valid email" do
    visit "/login"
    fill_in "Email", :with => "skylar@corkerykaulke.org"
    fill_in "Password", :with => "jams"
    click_button "login"
    expect(page).to have_text("My Post")
  end

  scenario "when logging in with invalid email" do
    visit "/login"
    fill_in "Email", :with => "wrong@email.com"
    fill_in "Password", :with => "jams"
    click_button "login"
    expect(page).to have_text("Email:")
  end

  scenario "when logging in with invalid password and email" do
    visit "/login"
    fill_in "Email", :with => "wrong@email.com"
    fill_in "Password", :with => "jamz"
    click_button "login"
    expect(page).to have_text("Email:")
  end

  scenario "when logging in with blank password and email" do
    visit "/login"
    fill_in "Email", :with => ""
    fill_in "Password", :with => ""
    click_button "login"
    expect(page).to have_text("Email:")
  end

end


