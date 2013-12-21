require 'spec_helper'

feature "User signs up" do


  scenario "when signing up with valid credentials" do
    sign_up_with("name","name@email.com", "12223")
    expect(page).to have_text("My Post")
  end

  scenario "when signing up with no email" do
    sign_up_with("name","", "12223")
    expect(page).to have_text("Email:")
  end

  scenario "when signing up with no password" do
    sign_up_with("name","name@email.com", "")
    expect(page).to have_text("Email:")
  end

  def sign_up_with(name, email, password)
    visit "/users/new"
    fill_in "Name", :with => name
    fill_in "Email", :with => email
    fill_in "Password", :with => password
    click_button "signup"
  end

end


