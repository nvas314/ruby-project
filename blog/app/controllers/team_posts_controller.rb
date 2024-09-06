class TeamPostsController < ApplicationController

  def create
    @team = Team.find(params[:team_id])
    @post = @team.team_posts.create(post_params)

    @team_members = UserTeam.where(team_id:params[:team_id])
    @team_members.update(saw_last:false)

    @team_members = UserTeam.where(user_id:session[:user_id],team_id:params[:team_id])
    @team_members.update(saw_last:true)#I have seen this post

    redirect_to request.referrer
  end

  def destroy
    @team = Team.find(params[:team_id])
    @post = @team.team_posts.find(prams[:id])
    @post.destroy
    redirect_to request.referrer
  end

  private

  def post_params
    params.require(:team_post).permit(:user_id, :post)
  end

end
