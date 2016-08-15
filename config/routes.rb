Rails.application.routes.draw do
  root to: "admin#index"

  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users  
  resources :addresses do
  	collection do
  		get :zip_code_search_from_correios
  	end
  end
end
