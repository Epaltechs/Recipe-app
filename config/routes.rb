Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users do
    resources :foods
  end

  resources :shopping_lists, only: %i[index]
  
  root 'recipes#index'
  # Defines the root path route ("/")
  # root "articles#index"
end
