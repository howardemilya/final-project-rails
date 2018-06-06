Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "static#home"
  resources :critics, :movies, :actors, :reviews, :genres
  get '/signup' => "critics#new"
  get '/login' => "sessions#new"
  post '/login' => "sessions#create"
  get '/signout' => "sessions#destroy"
  post '/critics/show' => "critics#update"

end
