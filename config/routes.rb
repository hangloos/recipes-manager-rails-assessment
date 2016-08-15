Rails.application.routes.draw do
  resources :categories
  resources :comments
  resources :ingredients
  resources :recipe_categories
  resources :recipeingredients
  resources :recipes
  devise_for :users

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
