Rails.application.routes.draw do
  root 'welcome#index'
  patch 'movies/:id/upvote' => 'movies#upvote', as: :upvote_movie
  patch 'books/:id/upvote' => 'books#upvote', as: :upvote_book
  patch 'albums/:id/upvote' => 'albums#upvote', as: :upvote_album
  resources :movies
  resources :books
  resources :albums

end
