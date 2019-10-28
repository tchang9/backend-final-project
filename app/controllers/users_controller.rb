class UsersController < ApplicationController

    def user_events
        user = curr_user
        events = user.events

        events_hash = {}
        events.each do |event|
            events_hash[event.id] = event
        end

        render :json => events_hash

    end

    def create
		user = User.new(
			first_name: params[:firstName],
			last_name: params[:lastName],
            email: params[:email],
            password: params[:password],
            profile_picture: ""
		)
        if user.save
			token = encode_token(user.id)

            puts user
            puts 11111111111111111111111111111111111111111111
            render json: {user: UserSerializer.new(user), token: token}
        else
			render json: {errors: user.errors.full_messages}
        end
    end

end
