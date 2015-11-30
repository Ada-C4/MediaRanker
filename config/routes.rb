Rails.application.routes.draw do
  root 'movies#home'
  patch 'movies/:id/upvote' => 'movies#upvote', as: :upvote
  resources :movies do
  end
end
