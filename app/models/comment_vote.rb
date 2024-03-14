class CommentVote < ApplicationRecord
  belongs_to :comment, counter_cache: :votes_count
end
