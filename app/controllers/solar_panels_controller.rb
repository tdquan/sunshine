class SolarPanelsController < ApplicationController

  def index
    @solar_panels = SolarPanel.where.not(user_id: current_user.id)
  end

  def new
    @solar_panel = current_user.solar_panels.new
  end

  def create
    @solar_panel = current_user.solar_panels.new(panel_params)
    @solar_panel.save
    redirect_to user_solar_panels_path
  end

  def show
    @solar_panel = SolarPanel.find(params[:id])
  end

  def show_my
    @solar_panels = current_user.solar_panels
  end

  def destroy

  end

  private

  def panel_params
    params.require(:solar_panel).permit(:size, :efficiency, :price)
  end
end
