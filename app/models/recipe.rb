class Recipe < ApplicationRecord
  has_many :ingredients
  has_many :recipe_categories
  has_many :categories, through: :recipe_categories
  belongs_to :user
  has_many :comments

  validates :name, presence: true

  accepts_nested_attributes_for :ingredients, :reject_if => :all_blank

  def cooked_or_not
    if self.status
      "You have cooked this recipe!"
    else
      "You have not cooked this recipe yet."
    end
  end






end
