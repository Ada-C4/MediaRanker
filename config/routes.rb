Rails.application.routes.draw do
  # root 'index'

  resources :movies do
  end

  resources :books do
  end

  resources :albums do
  end
end
