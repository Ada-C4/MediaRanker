Rails.application.routes.draw do
  root 'home#index'
  post 'movies/:id/upvote' => 'movies#upvote', as: :movie_upvote
  post 'books/:id/upvote' => 'books#upvote', as: :book_upvote
  post 'albums/:id/upvote' => 'albums#upvote', as: :album_upvote
  resources :movies
  resources :books
  resources :albums

end
