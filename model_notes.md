Rails Assessment  - Notes

Models:

User ( devise), Recipe, Ingredient, RecipeIngredient, Comment ( include 1-10 rating, comment), Category


User:

name:string address:string city:string zip:integer 

has_many :recipes
has_many :ingredients, through: :recipes
has_many :categories, through: :recipes
has_many :comments, through: :recipes



Recipe

name:string category_id:integer status:string( default - not cooked)

has_many :recipe_ingredients
has_many :ingredients, through: recipe_ingredients
has_many :categories
belongs_to :user
has_many :comments

Ingredient:

name:string quantity:string

has_many :recipe_ingredients
has_many :recipes, through: recipe_ingredients

RecipeIngredient:

recipe_id:integer ingredient_id:integer
belongs_to :recipe
belongs_to :ingredient

Comment: 

rating:integer comments:string recipe_id:integer

belongs_to :recipe
belongs_to :user 

Category:
name:string
has_many: recipes
