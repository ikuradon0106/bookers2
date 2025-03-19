Rails.application.routes.draw do
  root to: "homes#top"
  get 'homes/about', to: 'homes#about', as: :about
  devise_for :users
  post 'books' => 'books#create'
  
  resources :books, only: [:new, :create, :index, :show, :destroy]
  resources :users, only: [:edit, :show]

end
