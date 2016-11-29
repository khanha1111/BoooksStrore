Rails.application.routes.draw do
  root "application#home"
  resources :users
  resources :books
  resources :categories
  resources :reviews
  resources :relationships
  resources :ratings
  resources :comments
  resources :requests
  resources :activities, only: [:new,:create,:destroy]
  resources :likes, only: [:destroy]
  get "logout" => "sessions#destroy"
  get "login" => "sessions#new"
  get "actives" => "activities#create"
  get "logs" => "activities#actives_log"
  get "likes" => "likes#create"
  post "logs" => "activities#find_log"
  post "login" => "sessions#create"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
