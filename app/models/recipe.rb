class Recipe < ApplicationRecord
  has_many :ingredients
  has_many :recipe_categories
  has_many :categories, through: :recipe_categories
  belongs_to :user
  has_many :comments

  validates :name, presence: true

  accepts_nested_attributes_for :ingredients, :reject_if => :all_blank
  #:reject_if => lambda { |a| a[:when].blank? || a[:where].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :recipe_categories, :reject_if => :all_blank
  #accepts_nested_attributes_for :categories, :reject_if => :all_blank
  
  def cooked_or_not
    if self.status
      "You have cooked this recipe!"
    else
      "You have not cooked this recipe yet."
    end
  end






end
