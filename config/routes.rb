Rails.application.routes.draw do

  namespace "api" do
    namespace "v1" do
      resources :favorites
      resources :comments
      resources :song_tags
      resources :tags
      resources :songs
      resources :users

      post '/login', to: "auth#login"
      delete '/logout', to: "auth#logout"
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
