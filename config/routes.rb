Rails.application.routes.draw do
  resources :categories
  resources :comments
  resources :ingredients
  resources :recipe_categories
  resources :recipeingredients
  resources :recipes

  root 'welcome#index'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
