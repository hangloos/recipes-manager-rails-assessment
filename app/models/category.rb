class Category < ApplicationRecord
  has_many :recipe_categories
  has_many :recipes, through: :recipe_categories

  validates :name, presence: true

  #accepts_nested_attributes_for :recipe_categories, :reject_if => :all_blank
  #accepts_nested_attributes_for :recipes, :reject_if => :all_blank


end
