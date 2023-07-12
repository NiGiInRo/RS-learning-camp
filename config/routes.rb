Rails.application.routes.draw do
  resources :matches
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :targets, only: [:create, :index, :destroy]
  resources :topics, only: [:create, :index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
