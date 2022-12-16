Rails.application.routes.draw do
  get 'bookings/new'
  get 'bookings/create'
  root "flights#index"
  resources :flights, only: [:index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
