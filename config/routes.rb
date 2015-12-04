Rails.application.routes.draw do
  root 'homepage#index'
  resources :movies do
    member do
      post 'upvote'
    end
  end
  resources :books do
    member do
      post 'upvote'
    end
  end
  resources :albums do
    member do
      post 'upvote'
    end
  end
end
