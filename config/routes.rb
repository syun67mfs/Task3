Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#top'
  get 'home/about' => 'homes#about'

  devise_for :users

  resources :books
  resources :users, only: [:show, :edit, :index, :update]
end
