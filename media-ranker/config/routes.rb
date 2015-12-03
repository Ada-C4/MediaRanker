Rails.application.routes.draw do

  root 'application#index'

  resources :books
  resources :movies
  resources :albums

end
