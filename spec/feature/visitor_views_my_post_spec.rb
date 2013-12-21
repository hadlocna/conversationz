require 'spec_helper'

feature "Visitor views my post" do
  scenario "when viewing my post" do
    user = User.create(name: 'clark', email: "clark@gmail.com", password: 'jams')
    song = Song.create(title: 'Best hits of Enya', album: 'Enya Does it Again', short_url: "google.com")
    post = Post.create(title: 'clark rocks it', motivation: "I just love listening to myself rock it.  What can I say.", user_id: user.id, song_id: song.id)
    visit "/login"
    fill_in "Email", :with => "clark@gmail.com"
    fill_in "Password", :with => "jams"
    click_button "login"
    visit "/"    
    my_link = find(:css, "a:contains('My Post')")
    my_link.click
    expect(page).to have_text("clark")
  end
end
