Rails.application.routes.draw do
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :dragons do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:destroy]
  # Defines the root path route ("/")
  # root "articles#index"
end
