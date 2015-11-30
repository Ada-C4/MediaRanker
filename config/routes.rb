Rails.application.routes.draw do

  get '/' => 'home#all_media'

	resources :movies
	resources :albums
	resources :books

end