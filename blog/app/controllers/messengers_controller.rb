class MessengersController < ApplicationController  
  before_action :require_login

  
    def index
      @messengers = Messenger.where(user_id: session[:user_id])
      @messengers = @messengers.where.not(status:"invitation") #invitations are not messages  
      @messengers_c = @messengers.where(status:"contact")
      @messengers_m = @messengers.where(status:"messenger")
      @messengers_b = @messengers.where(status:"blocked")
      @teams_m = UserTeam.where(user_id: session[:user_id],saw_last:false)
    end
  
    def new
      @messenger = Messenger.new
    end
  
    def show
    end
  
  
    def create
      #@messenger = Messenger.new
      #@messengers = Messenger.find_by(user_id: session[:user_id],to_user_id:User.find_by(username: params[:username]).id)
      @to_user = User.find_by(username: params[:username])
      if User.where(username: params[:username]).blank?
      #flash[:alert] = "User does not exist"
        redirect_to new_messenger_path
      elsif @to_user.id == session[:user_id]
        redirect_to request.referrer
      elsif !Messenger.where(user_id: session[:user_id] , to_user_id:@to_user.id).blank?
        @c_change = Messenger.where(user_id: session[:user_id] , to_user_id:@to_user.id)
        @c_change.update(status: "contact")
        redirect_to messengers_path
      else
        @c_new = Messenger.new(user_id: session[:user_id] , to_user_id:@to_user.id , status: "contact", saw_last:true , last_message:DateTime.current)
        @c_new.save
        redirect_to messengers_path
      end
    end

    def block
      @messenger = Messenger.where(user_id:session[:user_id],to_user_id:params[:format])
      if !@messenger.blank?
      @messenger.update(status:"blocked")
      end
      redirect_to messengers_path
    end

    def invite_to_team
      @to_user = User.find_by(id:params[:format]).id
      @new_inv = Messenger.new(user_id:session[:user_id],to_user_id:@to_user,status:"invitation")
      @new_inv.save
      redirect_to private_message_path(@new_messenger)
    end

    def add_to_contact
      @messenger = Messenger.find_by(user_id:session[:user_id],to_user_id:params[:format])
      @messenger.update(status:"contact")
      redirect_to messengers_path
    end

    def destroy
        @messenger = Messenger.find(params[:id])
        @messenger.destroy
    
        redirect_to messengers_path, status: :see_other
    end
end
