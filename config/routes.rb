Rails.application.routes.draw do
  get "/events", to: "users#user_events"
  post "/topics", to: "events#event_topics"
end
