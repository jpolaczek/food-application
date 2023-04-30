Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  get :search, controller: :home
  
  resources :recipes, only: [:new, :create, :show, :destroy, :edit, :update]
end
