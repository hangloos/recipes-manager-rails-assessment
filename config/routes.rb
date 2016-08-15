Rails.application.routes.draw do
  resources :categories
  
  resources :recipe_categories
  resources :recipeingredients
  
  resources :recipes do 
    resources :ingredients, :comments
  end

  root 'welcome#index'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  post '/change_status' => 'recipes#update_status'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
