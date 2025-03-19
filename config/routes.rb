Rails.application.routes.draw do
  root to: "homes#top"
  get 'homes/about', to: 'homes#about', as: :about
  devise_for :users
  
  
  resources :books, only: [:new, :index, :show]
  resources :users, only: [:edit, :show]

end
