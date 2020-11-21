Rails.application.routes.draw do
  namespace :api do
    get "/memes" => "memes#index"
    post "/memes" => "memes#create"
    get "/memes/:id" => "memes#show"
    patch "/memes/:id" => "memes#update"
    delete "/memes/:id" => "memes#destroy"

    post "/signup" => "users#create"
    get "/users/index" => "users#index"
    get "/users/:id" => "users#show"
    # patch "/users/:id" => "users#update"
    
    post "/login" => "sessions#create"
    delete "/logout" => "sessions#destroy"
    get "/account" => "application#set_current_user"

    # resources :users, only: [:create, :show, :index]

  end
end
