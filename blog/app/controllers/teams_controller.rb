class TeamsController < ApplicationController
  
  def index
    @teams = Team.all
    @current_user = User.find_by_id(session[:user_id]) #<%= @current_user.username %>
  end

  def show
    @team = Team.find(params[:id])
    @current_user = User.find_by_id(session[:user_id])
    @owner_user = User.find_by_id(@team.owner_id)
    @members = UserTeam.where(team_id:@team).order('created_at DESC')

    if params.has_key?(:search)
      @search = params[:search]
    else
      @search = ""
    end

    @my_team = UserTeam.where(team_id:params[:id] , user_id: session[:user_id])
    if @my_team.blank?
      @last_saw = DateTime.current
      @my_team = UserTeam.new(team_id:params[:id] , user_id: session[:user_id] ,saw_last:true,last_message:DateTime.current)
      @my_team.save
    else
      @last_saw = @my_team.last.last_message
      @my_team.update(saw_last:true,last_message:DateTime.current)
    end
    
  end

  def new
    @team = Team.new
  end

  def edit
    @team = User.find_by(id: params[:new_owner])
  end

  def create
    @team = Team.new(team_params)

    if @team.save
      redirect_to @team
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])

    if @team.update(team_params)
      redirect_to @team
    else
      render :edit, status: :unprocessable_entity
    end
  end


  def destroy
    @team = Team.find(params[:id])
    @team.destroy

    redirect_to request.referrer, status: :see_other
  end


  private
    def team_params
      params.require(:team).permit(:title, :owner_id, :status)
    end
end
