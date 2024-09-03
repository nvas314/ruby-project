class ApplicationController < ActionController::Base

    def current_user
        if session[:user_id]
          @user = User.find(session[:user_id])
        end
      end

    def is_logged_in?
        !!current_user
    end
end
