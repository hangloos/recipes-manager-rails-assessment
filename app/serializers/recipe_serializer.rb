class RecipeSerializer < ActiveModel::Serializer

attributes :id, :name, :ingredients_attributes

end