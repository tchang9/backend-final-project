Rails.application.routes.draw do
  get "/events", to: "users#user_events"
  post "/topics", to: "events#event_topics"
  post "/comments", to: "topics#topic_comments"
end
