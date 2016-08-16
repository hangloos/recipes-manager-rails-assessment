class Recipe < ApplicationRecord
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :recipe_categories
  has_many :categories, through: :recipe_categories
  belongs_to :user
  has_many :comments

  validates :name, presence: true




  def cooked_or_not
    if self.status
      "You have cooked this recipe!"
    else
      "You have not cooked this recipe yet."
    end
  end




end
