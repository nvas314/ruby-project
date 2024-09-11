class UsersController < ApplicationController

    #POST /signup
    def create
        @user = User.create(signup_params)
        json_response(@user, :created)
      end

      private
  
      def signup_params
        # whitelist params
        params.permit(:username, :password, :password_digest)
      end

end
