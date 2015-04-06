Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :comments
  resources :contacts
  resources :users
  resources :home, only:[:show]
  get "login" => "sessions#new", :as => "login"
  get "sign_up" => "users#new", :as => "sign_up"
  get "logout" => "sessions#destroy", :as => "logout"
  root to: "sessions#new"
end
