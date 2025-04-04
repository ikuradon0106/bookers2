Rails.application.routes.draw do
  root to: "homes#top"
  get "home/about", to: "homes#about"
  devise_for :users
  
  resources :users, only: [:index, :show, :edit, :update]
  resources :books, only: [:index, :show, :create, :edit, :update, :destroy]

end
