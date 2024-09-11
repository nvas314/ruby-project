class UserTeamsController < ApplicationController
  before_action :require_login

  
  def index
    #@myteams = UserTeam.where(user_id:session[:user_id])
    @myteams = Team.includes(:user_teams).where("user_teams.user_id" => session[:user_id],"user_teams.status" => "joined")
    @myteams = @myteams.order('last_message DESC')

    @invites = Team.includes(:user_teams).where("user_teams.user_id" => session[:user_id],"user_teams.status" => "invitation")

    @invitations = Team.includes(:user_teams).where("user_teams.user_id" => session[:user_id]).where(status:"invitation")

  end

  def create
    if User.where(username:params[:username]).blank?
      #flash[:alert] = "User does not exist"
    elsif !UserTeam.where(team_id:params[:team_id],user_id:User.find_by(username:params[:username]).id).blank? #if user invited or joined already
    else
    @inv = UserTeam.new(team_id:params[:team_id],user_id:User.find_by(username:params[:username]).id,status:params[:status])
    if @inv.save
      redirect_to request.referrer
    else
      redirect_to request.referrer, status: :unprocessable_entity
    end
  end
  end

  def destroy
    @myteam = UserTeam.find(params[:id])
    @myteam.destroy
    redirect_to request.referrer
  end


  private

  def post_params
    params.require(:team_post).permit(:team_id,:user_id, :status)
  end
end
