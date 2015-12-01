Rails.application.routes.draw do

  get '/' => 'home#all_media', as: :home

	resources :movies
	resources :albums
	resources :books

	post 'movies/:id' => 'movies#upvote', as: :movie_upvote
	post 'album/:id' => 'album#upvote', as: :album_upvote
	post 'books/:id' => 'books#upvote', as: :book_upvote

end