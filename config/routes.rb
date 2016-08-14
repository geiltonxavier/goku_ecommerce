Rails.application.routes.draw do
  root to: "admin#index"

  devise_for :users
  resources :users  
  resources :addresses
end
