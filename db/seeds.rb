# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

5.times do
  User.create!(
               :name     => Faker::Internet.user_name,
               :email    => Faker::Internet.email,
               :password => "jams"
              )
end

10.times do
  song = Song.create!(
               :short_url => Faker::Internet.url,
               :title     => Faker::Lorem.words(3),
               :artist    => Faker::Lorem.words(2),
               :album     => Faker::Lorem.words(3),
               :year      => rand(1950..2013)
              )

  song_id = song.id

  post = Post.create!(
               :title         => Faker::Lorem.words(3),
               :motivation    => Faker::Lorem.words(7),
               :user_id       => User.order("RANDOM()").first.id,
               :song_id       => song_id
              )

  post_id = post.id

  comments_number = rand(5) + 1

  comments_number.times do
    comment = Comment.create!(
                              :user_id => User.order("RANDOM()").first.id,
                              :body    => Faker::Lorem.words(10),
                              :song_id => song_id,
                              :post_id => post_id
                             )

    comment_id = comment.id

    (User.order("RANDOM()").first.id * 2).times do
      CommentVote.create!(
                          :user_id    => User.order("RANDOM()").first.id,
                          :comment_id => comment_id,
                          :is_up_vote => rand(2) > 0 ? true : false
                         )
      end
  end
end
