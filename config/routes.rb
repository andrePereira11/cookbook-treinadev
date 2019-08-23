Rails.application.routes.draw do
  root to: 'recipes#index'

  # o normal é passar symbols, mas o %i[] faz com que precise apenas dos nomes das actions
  resources :recipes, only: %i[index show new create edit update]
  resources :recipe_types, only: %i[show new create]
end
