class ApplicationController < ActionController::Base
  before_action :update_notifications
  before_action :update_invites

  def update_notifications
    if session[:user_id]
      @notf_messages = Messenger.where(user_id:session[:user_id],saw_last:false).count
      if @notf_messages == 0
      @notf_messages = ""
      else
      @notf_messages = "(#{@notf_messages})"
      end
    end
  end

  def update_invites
    if session[:user_id]
      @notf_invites = UserTeam.where(user_id:session[:user_id],status:"invitation").count
      if @notf_invites == 0
      @notf_invites = ""
      else
      @notf_invites = "(#{@notf_invites})"
      end
    end
  end

    def current_user
        if session[:user_id]
          @user = User.find(session[:user_id])
        end
      end

    def is_logged_in?
        !!current_user
    end


    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end
  
    # Returns true if the user is logged in, false otherwise.
    def logged_in?
      !current_user.nil?
    end


    def require_login
      if !logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to root_path 
      end
    end
end
