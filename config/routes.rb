Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users do
    resources :foods
    resources :recipes #only: %i[index new show create]
     resources :shopping_lists, only: %i[index]
  end

  root 'users#index'

  # Defines the root path route ("/")
  # root "articles#index"
end
