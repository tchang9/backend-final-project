Rails.application.routes.draw do
  resources :topics, only: [:create]

  get "/events", to: "users#user_events"
  post "/fetch-topics", to: "events#event_topics"
  post "/comments", to: "topics#topic_comments"
end
