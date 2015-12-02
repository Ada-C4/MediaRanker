Rails.application.routes.draw do

  get '/' => 'home#all_media', as: :home

	resources :movies
	resources :albums
	resources :books

	patch 'movies/:id/upvote' => 'movies#upvote', as: :upvote_movie
	patch 'album/:id/upvote' => 'albums#upvote', as: :upvote_album
	patch 'books/:id/upvote' => 'books#upvote', as: :upvote_book

end