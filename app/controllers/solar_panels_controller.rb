class SolarPanelsController < ApplicationController
  # before_action :user_session

  def index
    @solar_panels = SolarPanel.all
  end

  def new
    @solar_panel = current_user.solar_panels.new
  end

  def create
    @solar_panel = current_user.solar_panels.new(panel_params)
    @solar_panel.save
    redirect_to solar_panels_path
  end

  def show
    @solar_panel = current_user.solar_panels.find(params[:id])
  end

  def destroy

  end

  private

  def panel_params
    params.require(:solar_panel).permit(:size, :efficiency, :price)
  end
end
