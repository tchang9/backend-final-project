class Event < ApplicationRecord
    has_many :activities, dependent: :delete_all
    has_many :topics, dependent: :delete_all
    has_many :user_events, dependent: :delete_all
    has_many :users, through: :user_events
end
