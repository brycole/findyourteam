class PendingApplicationsController < ApplicationController
  before_action :set_application, only: %i[show destroy captain_approve player_approve]

  def index
    @team = Team.find(params[:team_id])
    @is_captain = captain?(@team)
    @pending_applications = @team.pending_applications
  end

  def captain?(team)
    team.user == current_user
  end

  def captain_approve
    team = Team.find(params[:team_id])
    @pending_application.owner_approval = true
    @pending_application.save

    fill_position
    redirect_to team_positions_path(team)
  end

  def player_approve
    team_id = @pending_application.position.team.id
    team = Team.find(team_id)
    @pending_application.user_approval = true
    @pending_application.save

    fill_position
    redirect_to team_positions_path(team)
  end

  def fill_position
    @position = Position.find(@pending_application.position.id)
    if @position.user.nil?
      if @pending_application.owner_approval && @pending_application.user_approval
        @position.user = @pending_application.user
        @position.save
        destroy
      end
    end
  end

  def show
  end

  def create
    @position = Position.find(params[:position_id])
    @pending_application = PendingApplication.new
    @pending_application.user = current_user
    @pending_application.position = @position
    if @pending_application.position.team.captain?(current_user)
      @pending_application.owner_approval = true
      @pending_application.user_approval = true
    else
      @pending_application.user_approval = true
    end

    if @pending_application.save
      fill_position
      redirect_to team_positions_path(@position.team)
    else
      redirect_to request.referrer
    end
  end

  def destroy
    @pending_application.destroy
    redirect_to request.referrer if params[:action] == "destroy"
  end

  def create_invitation
    # Currently only works if you select everything correctly
    @player = User.find(params[:player])
    @captain = current_user
    @team = @captain.teams.where(game_id: params[:game_id]).first
    @position = @team.positions.where(position_name_id: params[:position]).first
    # Bryan's code from here onwards
    @pending_application = PendingApplication.new
    @pending_application.user = @player
    @pending_application.position = @position
    @pending_application.owner_approval = true
    if @pending_application.save
      fill_position
      redirect_to team_positions_path(@position.team)
    else
      redirect_to request.referrer
    end
  end

  private

  def set_application
    @pending_application = PendingApplication.find(params[:id])
  end
end
