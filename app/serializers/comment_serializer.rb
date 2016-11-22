class CommentSerializer < ActiveModel::Serializer
  attributes :id, :rating, :comments, :recipe_id
  has_one :recipe
end
