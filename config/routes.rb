Rails.application.routes.draw do
  get 'reviews/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :books do
    resources :reviews, only: %i[new create]
  end

  root to: "books#index"

  # Defines the root path route ("/")
  # root "articles#index"
end
