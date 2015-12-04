Rails.application.routes.draw do
  root 'homepage#index'
  resources :movies
  resources :books
  resources :albums
end
