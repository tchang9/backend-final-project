class AuthController < ApplicationController
    def login
      user = User.find_by(email: params[:email])
  
  
      if user && user.authenticate(params[:password])
        token = encode_token(user.id)
  
        render json: {user: UserSerializer.new(user), token: token}
      else
        render json: {message: "Invalid username or password"}
      end
    end
  
    def auto_login
      if curr_user
        render json: curr_user
      else
        render json: {errors: "You dun goofed!"}
      end
    end
end
