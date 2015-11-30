Rails.application.routes.draw do
  root 'movies#home'

  resources :movies do
  end

  resources :books do
  end

  resources :albums do
  end
end
