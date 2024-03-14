# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create a few posts
5.times do |i|
  Post.create!
end

# Assuming each Post will have a random number of comments
Post.all.each do |post|
  rand(1..5).times do
    comment = post.comments.create!(votes_count: rand(0..10)) # Randomly assigning votes_count

    # Assuming each Comment will have a random number of votes
    rand(1..10).times do
      CommentVote.create!(comment: comment)
    end
  end
end

puts "Seed data created successfully!"
