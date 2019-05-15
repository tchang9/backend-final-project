class UsersController < ApplicationController

    def user_events
        user = User.find(5)
        events = user.events

        render :json => events
    end

end
