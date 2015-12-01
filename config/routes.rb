Rails.application.routes.draw do
  root 'application#index'
  patch 'movies/:id/upvote' => 'movies#upvote', as: :movies_upvote
  patch 'books/:id/upvote' => 'books#upvote', as: :books_upvote
  patch 'albums/:id/upvote' => 'albums#upvote', as: :albums_upvote
  resources :movies
  resources :books
  resources :albums

end
