Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  get 'dashboard', to: 'dragons#dashboard'
  get 'bookings', to: 'bookings#dashboard'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :dragons do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:index, :show, :destroy]
  # Defines the root path route ("/")
  # root "articles#index"
end
