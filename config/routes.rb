Rails.application.routes.draw do
  
  resources :recipes do 
    resources :ingredients, :categories
  end

  resources :recipes do
    resources :comments
  end

  root 'welcome#index'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  post '/change_status' => 'recipes#change_status'
  post '/ratings_search' => 'recipes#ratings_search'

  get '/recipes/ingredients/new' => 'ingredients#new'

  post '/ingredients' => 'ingredients#create'

  post '/recipes/:id' => 'recipes#update'

  get '/comments' => 'comments#index'

end
