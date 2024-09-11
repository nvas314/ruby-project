class AuthController < ApplicationController

    #GET /auth/logout
    def index
        session[:user_id] = nil
        json_response(@user, :created)
      end

    #POST /auth/login
    def create
        @user = User.find_by(username:params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            json_response(@user)
        else
        end
      end


      private
  
      def login_params
        # whitelist params
        params.permit(:username, :password)
      end

end
