class Category < ApplicationRecord
  has_many :recipe_categories
  has_many :recipes, through: :recipe_categories

  validates :name, presence: true

  #accepts_nested_attributes_for :recipe_categories, :reject_if => lambda { |a| a[:when].blank? || a[:where].blank? }, :allow_destroy => true
  #accepts_nested_attributes_for :recipes, :reject_if => lambda { |a| a[:when].blank? || a[:where].blank? }, :allow_destroy => true


end
