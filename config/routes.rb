Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: "registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :watchlists
  resources :movies do
     resources :comments
  end
  resources :search
  resources :users
  resources :favorites
  root 'movies#index'
end
