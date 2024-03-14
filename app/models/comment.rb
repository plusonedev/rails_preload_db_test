class Comment < ApplicationRecord
  belongs_to :post
  scope :popular, -> { where("votes_count > 5") }
end

