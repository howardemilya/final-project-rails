Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "static#home"
  resources :critics, :actors, :reviews, :genres
  resources :movies do
    resources :reviews
  end
  get '/best_movies' => 'static#best_rated'
  get 'auth/google_oauth2/callback' => 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get '/signup' => "critics#new"
  get '/login' => "sessions#new"
  post '/login' => "sessions#create"
  get '/signout' => "sessions#destroy"
  post '/critics/show' => "critics#update"


end
