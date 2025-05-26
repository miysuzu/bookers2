Rails.application.routes.draw do
  devise_for :users
  root to: 'books#index'
  resources :books

  resources :users, only: [:index, :show, :edit, :update]

  get 'home/top' => 'homes#top'
  get 'home/about' => 'homes#about'
end
