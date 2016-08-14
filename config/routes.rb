Rails.application.routes.draw do
  root to: "admin#index"

  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users  
  resources :addresses
end
