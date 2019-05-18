Rails.application.routes.draw do
  resources :topics, only: [:create]
  resources :users, only: [:create] #sign up
  post '/login', to: 'auth#login' #sign in 
  get '/profile', to: 'users#profile' #profile
  get "/auto_login", to: "auth#auto_login"

  get "/events", to: "users#user_events"
  post "/fetch-topics", to: "events#event_topics"
  post "/comments", to: "topics#topic_comments"
end
