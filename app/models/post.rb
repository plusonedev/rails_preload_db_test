class Post < ApplicationRecord
  has_many :comments
  has_many :popular_comments, -> { popular }, class_name: "Comment"
end
