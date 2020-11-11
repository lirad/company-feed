Rails.application.routes.draw do
  resources :opinions
  
  get 'static/index'

  get '/profile/:id', to: 'profiles#show', as: 'profile'

  resources :followings do
    
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :users, :controllers => {registrations: 'registrations'}

  # devise_scope :user do
  #   root to: "devise/sessions#new"
  # end

  # authenticated :user do
  #   
  # end

  root :to => "opinions#index"
end
