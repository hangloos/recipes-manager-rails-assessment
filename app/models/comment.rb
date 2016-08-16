class Comment < ApplicationRecord
  belongs_to :recipe
  belongs_to :user

  validates :rating, :comments, presence: true

end
