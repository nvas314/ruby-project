class ContactsController < ApplicationController
  def index
    @contacts = Contact.where(user_id: session[:user_id])
  end

  def new
    @contact = Contact.new
  end

  def show
    @contacts = Contact.find_by(user_id: session[:user_id])
  end


  def create
    #@contact = Contact.new
    @to_user = User.find_by(username: params[:username])
    if @to_user
      @c_new = Contact.new(user_id: session[:user_id] , to_user_id:@to_user.id)
      @c_new.save
      redirect_to contacts_path
    else
      redirect_to new_contact_path
    end
  end


end
