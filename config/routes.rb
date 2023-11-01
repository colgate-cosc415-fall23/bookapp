Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  devise_for :users

  resources :books do
    resources :reviews, only: %i[new create]
  end

  root to: "books#index"
end
