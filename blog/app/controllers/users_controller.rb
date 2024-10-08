class UsersController < ApplicationController

    def index
        @current_user = User.find_by(id:session[:user_id])
      end
    
      def show
        @user = User.find(params[:id])
      end
    
      def new
        @user = User.new
      end
      def create
        @user = User.new(user_params)
    
        if @user.save
          session[:user_id] = @user.id
          redirect_to root_path
        else
          #flash[:alert] = "Sign up failed"
          render new_user_path  , status: :unprocessable_entity
        end
      end
    
      def edit
        @user = User.find(params[:id])
      end
    
      def update
        @user = User.find(params[:id])
    
        if @user.update(user_params)
          redirect_to root_path
        else
          render :edit, status: :unprocessable_entity
        end
      end
    
    
      def destroy
        @user = User.find(params[:id])
        @user_id = @user.id
        @created_teams = Team.where(owner_id:@user_id).destroy_all
        @user.destroy
        redirect_to logout_path
      end
    
    
      private
        def user_params
          params.require(:user).permit(:username, :password, :name , :email ,:password_confirmation , :password_digest)
        end
end
