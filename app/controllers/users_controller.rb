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

    def create
		user = User.new(
			first_name: params[:first_name],
			last_name: params[:last_name],
            email: params[:email],
            password: params[:password],
            profile_picture: ""
		)
		if user.save
			token = encode_token(user.id)

            render json: {user: UserSerializer.new(user), token: token}
		else
			render json: {errors: user.errors.full_messages}
        end
    end

end
