Rails.application.routes.draw do

  root 'application#index'

  post 'movies/:id/upvote' => 'movies#upvote', as: :upvote_movie
  post 'books/:id/upvote' => 'books#upvote', as: :upvote_book
  post 'albums/:id/upvote' => 'albums#upvote', as: :upvote_album

  resources :movies
  resources :books
  resources :albums

end
