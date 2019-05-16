class UsersController < ApplicationController

    def user_events
        user = User.find(5)
        events = user.events

        events_hash = {}
        events.each do |event|
            events_hash[event.id] = event
        end

        render :json => events_hash

    end

end
