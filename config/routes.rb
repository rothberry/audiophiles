Rails.application.routes.draw do

  namespace "api" do
    namespace "v1" do
      resources :favorites, only: [:show, :create, :destroy]
      resources :comments, only: [:show, :create, :destroy]
      # resources :song_tags # don't need
      resources :tags, only: [:index, :create, :destroy, :update]
      resources :songs
      resources :users, except: [:create]
      get '/profile', to: "users#profile"

      # ! AUTH
      get '/me', to: "auth#me"
      post '/signup', to: "users#create"
      post '/login', to: "auth#login"
      delete '/logout', to: "auth#logout"
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
