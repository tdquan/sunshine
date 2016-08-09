class SolarPanelsController < ApplicationController
  before_action :user_session

  def new
    @solar_panel = SolarPanel.new
  end

  def create
    @solar_panel = SolarPanel.new
    @solar_panel.user_id = @current_user.id
  end
  def show

  end

  def destroy

  end

  private

  def panel_params
    params.require(:solar_panel).permit(:user_id, :size, :efficiency, :price)
  end
end
