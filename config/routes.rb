Rails.application.routes.draw do
  devise_for :users
  root to: 'recipes#index'
  get 'search', action: :search, controller: 'recipes'


  # o normal é passar symbols, mas o %i[] faz com que precise apenas dos nomes das actions
  resources :recipes, only: %i[index show new create edit update]
  resources :recipe_types, only: %i[show new create]
end
