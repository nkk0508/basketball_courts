Rails.application.routes.draw do
  post "favorites/:court_id/create" => "favorites#create"
  post "favorites/:court_id/destroy" => "favorites#destroy"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  root to: 'home#top'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
