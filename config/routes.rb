Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users do
    resources :foods
    resources :recipes, only: %i[index new show create destroy]
    resources :public_recipes
  end

  resources :public_recipes, only: %i[index]
  resources :shopping_lists, only: %i[index]
  resources :recipe_foods, only: %i[new create destroy]


  root 'recipes#index'

  # Defines the root path route ("/")
  # root "articles#index"
end
