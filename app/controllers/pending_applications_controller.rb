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
    @application.position = Position.find(params[:team_id])
    if @application.user == @application.position.team.user
      @application.owner_approval = true
    else
      @application.user_approval = true
    end
  end

  def destroy
    @appplication.destroy
  end

  private

  def set_application
    @application = PendingApplication.find(params[:id])
  end

end
