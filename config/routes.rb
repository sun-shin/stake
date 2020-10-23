Rails.application.routes.draw do
  namespace :api do
    get "/users/:id" => "users#show"
    post "/users" => "users#create"
    patch "/users/:id" => "users#edit"
    delete "/users/:id" => "users#destroy"
    
    post "/sessions" => "sessions#create"

    get "/events" => "events#index"
    get "/events/:id" => "events#show"
    post "/events" => "events#create"
    patch "/events/:id" => "events#edit"
    delete "/events/:id" => "events#destroy"

    get "/event_users" => "event_users#index"
    post "/event_users" => "event_users#create"
    delete "/event_users/:id" => "event_users#destroy"

    get "/tags" => "tags#index"
  end
end
