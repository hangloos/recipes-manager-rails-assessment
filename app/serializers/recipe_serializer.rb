class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :ingredients, :status
  has_many :comments
end
