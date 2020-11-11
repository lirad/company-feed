Rails.application.routes.draw do
  
  get '/profile/:id', to: 'profiles#show', as: 'profile'

  resources :opinions, only: [:show, :create, :index]
  resources :followings, only: [:create, :destroy, :index] 

  devise_for :users, :controllers => {registrations: 'registrations'}

  root :to => "opinions#index"
end
