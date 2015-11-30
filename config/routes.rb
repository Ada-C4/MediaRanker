Rails.application.routes.draw do
  root 'home#index'
  post 'movies/:id/upvote' => 'movies#upvote', as: :movie_upvote
  resources :movies
  resources :books
  resources :albums

end
