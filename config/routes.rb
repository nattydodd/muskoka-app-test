Rails.application.routes.draw do

  resources :sessions, only: [:new, :create, :destroy]
  
  root 'users#home'

  get '/about' => 'users#about'

  resources :users

  resources :entries

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
