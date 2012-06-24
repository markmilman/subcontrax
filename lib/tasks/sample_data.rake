namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_microposts 25, 50
    make_relationships
  end
end

namespace :db do
  desc "create test posts"
  task test_posts: :environment do
    make_microposts
  end
end

def make_users
  admin = User.create!(name: "Mark Milman",
                       email: "mark@miyasolutions.com",
                       password: "123456",
                       password_confirmation: "123456")
  admin.toggle!(:admin)
  99.times do |n|
    name = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password = "password"
    User.create!(name: name,
                 email: email,
                 password: password,
                 password_confirmation: password)
  end

end

def make_microposts(post_count=5, user_count=6)

  users = User.all(limit: user_count)
  post_count.times do
    content = Faker::Lorem.sentence(5)
    users.each { |user| user.microposts.create!(content: content) }
  end

end

def make_relationships
  users = User.all
  user = users.first
  followed_users = users[2..50]
  followers = users[3..40]
  followed_users.each { |followed| user.follow!(followed) }
  followers.each { |follower| follower.follow!(user) }
end