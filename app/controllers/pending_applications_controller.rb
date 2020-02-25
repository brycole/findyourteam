class PendingApplicationsController < ApplicationController
  before_action :set_application, only: %i[show destroy]


  def index
    @applications = PendingApplication.all
  end

  def show
  end

  def create
    @application = PendingApplication.new
    @application.user = current_user
    @application.position = Position.find(params[:format])
    if @application.position.team.captain?(current_user)
      @application.owner_approval = true
    else
      @application.user_approval = true
    end

    if @application.save
      redirect_to pending_applications_path
    else
      redirect_to team_positions_path(team)
    end
  end

  def destroy
    @application.destroy
  end

  private

  def set_application
    @application = PendingApplication.find(params[:id])
  end

end
