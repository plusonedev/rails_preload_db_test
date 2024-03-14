class CreatePostsCommentsAndCommentVotes < ActiveRecord::Migration[7.1]
  def change
    # Create posts table
    create_table :posts do |t|
      t.timestamps
    end

    # Create comments table with a reference to posts
    create_table :comments do |t|
      t.references :post, null: false, foreign_key: true
      t.integer :votes_count, default: 0, null: false
      t.timestamps
    end

    # Create comment_votes table with a reference to comments
    create_table :comment_votes do |t|
      t.references :comment, null: false, foreign_key: true
      t.timestamps
    end
  end
end


# irb(main):004> posts = Post.preload(:popular_comments).limit(5)
#   Post Load (0.2ms)  SELECT "posts".* FROM "posts" /* loading for pp */ LIMIT ?  [["LIMIT", 5]]
#   Comment Load (0.2ms)  SELECT "comments".* FROM "comments" WHERE (votes_count > 5) AND "comments"."post_id" IN (?, ?, ?, ?, ?)  [["post_id", 1], ["post_id", 2], ["post_id", 3], ["post_id", 4], ["post_id", 5]]
