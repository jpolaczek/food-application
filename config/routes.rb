Rails.application.routes.draw do
  root "home#index"
  get :search, controller: :home
  
  resources :recipes, only: [:new, :create]
end
