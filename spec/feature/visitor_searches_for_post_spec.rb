require 'spec_helper'

feature "Visitor searches for post" do
  scenario "when searching for post" do
    user = User.create(name: 'clark', email: "clark@gmail.com", password: 'jams')
    song = Song.create(title: 'Best hits of Enya', album: 'Enya Does it Again', short_url: "google.com")
    post = Post.create(title: 'clark rocks it', motivation: "I just love listening to myself rock it.  What can I say.", user_id: user.id, song_id: song.id)
    visit "/"
    fill_in "Search", :with => "clark rocks it"
    click_button "search"
    expect(page).to have_text("love")
  end
end


