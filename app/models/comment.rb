class Comment < ApplicationRecord
  belongs_to :recipe
  belongs_to :user

  validates :rating, :comments, presence: true
  validates :rating, :inclusion => 1..10
end
