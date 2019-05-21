Rails.application.routes.draw do
  resources :topics, only: [:create]
  resources :users, only: [:create] #sign up
  resources :comments, only: [:create]
  
  post '/login', to: 'auth#login' #sign in 
  get '/profile', to: 'users#profile' #profile
  get "/auto_login", to: "auth#auto_login"

  get "/events", to: "users#user_events"
  post "/fetch-topics", to: "events#event_topics"
  post "/fetch-comments", to: "topics#topic_comments"
  post "/fetch-activities", to: "events#event_activities"
end
