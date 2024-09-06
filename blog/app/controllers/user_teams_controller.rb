class UserTeamsController < ApplicationController
  def index
    #@myteams = UserTeam.where(user_id:session[:user_id])
    @myteams = Team.includes(:user_teams).where("user_teams.user_id" => session[:user_id])
    @myteams = @myteams.order('last_message DESC')

  end


  def destroy
    @myteam = UserTeam.find(params[:id])
    @myteam.destroy
    redirect_to request.referrer
  end
end
