class PrivateMessagesController < ApplicationController
  def index
  end

  def new
  end

  def show
    #@messenger = Messenger.find(params[:id])
    @to_user = User.find_by(id:params[:id])
    @messenger = Messenger.find_by(user_id:session[:user_id])
    @messages = PrivateMessage.where(user_id: session[:user_id], to_user_id:@to_user.id).or(PrivateMessage.where(user_id: @to_user.id, to_user_id:session[:user_id])).order('created_at ASC')
    @new_message = PrivateMessage.new(user_id: session[:user_id] , to_user_id:@to_user.id)

    @last_saw = @messenger.last_message
    unless @last_saw
      @last_saw = DateTime.current
    end
    @messenger.update(saw_last:true,last_message:DateTime.current)
  end

  def create
    @prv_msg = PrivateMessage.new(message_params)
    @to_user = Messenger.where(user_id:params[:private_message][:to_user_id],to_user_id:params[:private_message][:user_id])
    if @prv_msg.save
      if @to_user.blank?
        @to_user = Messenger.new(user_id:params[:private_message][:to_user_id],to_user_id:params[:private_message][:user_id],status:'messenger',saw_last:false)
        @to_user.save
        redirect_to  request.referrer
      else
        @to_user.update(saw_last:false)
        redirect_to  request.referrer
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def message_params
    params.require(:private_message).permit(:user_id, :to_user_id, :text)
  end
end
