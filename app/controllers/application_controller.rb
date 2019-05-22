class ApplicationController < ActionController::API
    def encode_token(user_id)
        JWT.encode({user_id: user_id}, ENV["jwt_secret"])
    end

    def get_token
        request.headers["Authorization"]
    end

    def decode_token
        # byebug
    begin
        JWT.decode(get_token, ENV["jwt_secret"])[0]["user_id"]
    rescue
        # Token invalid, return nil
        nil
    end
    end

    def curr_user
        # token_in_headers = request.headers["Authorization"]
        # data_in_token = JWT.decode(get_token, ENV["jwt_secret"])[0]
        # user_id = data_in_token["user_id"]

        # User.find_by(id: user_id)
        User.find_by(id: decode_token)
    end
end
