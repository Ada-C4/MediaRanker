Rails.application.routes.draw do
  root 'movies#home'

  post 'movies/:id/upvote' => 'movies#upvote', as: :upvote_movie
  post 'books/:id/upvote' => 'books#upvote', as: :upvote_book
  post 'albums/:id/upvote' => 'albums#upvote', as: :upvote_album
  resources :movies do
  end

  resources :books do
  end

  resources :albums do
  end
end
