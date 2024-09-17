class TeamsController < ApplicationController
  before_action :require_login 
  after_action :is_joined? , only: [:show]


  def index
    @teams = Team.all
    @current_user = User.find_by_id(session[:user_id]) #<%= @current_user.username %>
  end

  def show
    @team = Team.find(params[:id])
    @current_user = User.find_by_id(session[:user_id])
    @owner_user = User.find_by_id(@team.owner_id)
    @members = UserTeam.where(team_id:@team,status:"joined").order('created_at DESC')
    @my_messengers = Messenger.where(user_id:session[:user_id])

    if params.has_key?(:search)
      @search = params[:search]
    else
      @search = ""
    end

    @my_team = UserTeam.where(team_id:params[:id] , user_id: session[:user_id],status:"joined")
    @team_inv = UserTeam.where(team_id:params[:id] , user_id: session[:user_id],status:"invitation")
    if !@team_inv.blank?
      @last_saw = DateTime.current
      @team_inv = UserTeam.find_by(team_id:params[:id] , user_id: session[:user_id],status:"invitation")
      @team_inv.update(status:"joined",saw_last:true,last_message:DateTime.current)
    elsif @my_team.blank?
      @last_saw = DateTime.current
      @my_team = UserTeam.new(team_id:params[:id] , user_id: session[:user_id] ,saw_last:true,status:"joined",last_message:DateTime.current)
      @my_team.save
    else
      @last_saw = @my_team.last.last_message
      @my_team.update(saw_last:true,last_message:DateTime.current)
    end
    

    @messages = PrivateMessage.where(user_id: session[:user_id]).or(PrivateMessage.where(to_user_id:session[:user_id])).order('created_at ASC')
    @inv = UserTeam.new
    @owner = Team.find_by(id:params[:id])
  end

  def new
    @team = Team.new
  end

  def owner
    @team_owner = Team.find(params[:team_id])
    @team_owner.update(owner_id:params[:user_id])
    redirect_to team_path(params[:team_id])
  end

  def create
    @team = Team.new(team_params)

    if @team.save
      redirect_to @team
    else
      #flash[:alert] = "Cannot create team"
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
    
    def is_joined? #is joined in the team?
      if UserTeam.where(user_id:session[:user_id],team_id:params[:id]).blank?
      #flash[:error] = "You are not in this team"
      redirect_to user_teams_path 
      end
    end

  end
  
