class MessengersController < ApplicationController
    def index
      @messengers = Messenger.where(user_id: session[:user_id])
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
      @to_user = User.find_by(username: params[:username])
      if (@to_user && Messenger.where(user_id: session[:user_id] , to_user_id:@to_user.id , status: "contact").blank?)
        @c_new = Messenger.new(user_id: session[:user_id] , to_user_id:@to_user.id , status: "contact", saw_last:true)
        @c_new.save
        redirect_to messengers_path
      else
        redirect_to new_messenger_path
      end
    end

    def destroy
        @messenger = Messenger.find(params[:id])
        @messenger.destroy
    
        redirect_to messengers_path, status: :see_other
    end
end
