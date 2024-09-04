class PrivateMessagesController < ApplicationController
  def index
  end

  def new
  end

  def show
    @message = PrivateMessage.all
  end

  def create
    @m_new = Messenger.new(user_id: session[:user_id] , to_user_id:@to_user.id , text: "contact")
    @m_new.save
  end
end
