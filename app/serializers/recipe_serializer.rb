class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :ingredients
  has_many :comments
end
