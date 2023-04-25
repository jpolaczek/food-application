Rails.application.routes.draw do
  root "home#index"
  post :search, controller: :home
end
