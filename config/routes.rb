Rails.application.routes.draw do
  
  
  resources :recipes do 
    resources :ingredients, :comments, :categories
  end

  root 'welcome#index'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  post '/change_status' => 'recipes#update_status'
  post '/ratings_search' => 'recipes#ratings_search'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
