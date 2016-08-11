class SolarPanelsController < ApplicationController

  def index
    @solar_panels = SolarPanel.where.not(user_id: current_user.id)
  end

  def located_solar_panels
    if current_user
      @solar_panels = SolarPanel.where.not(user_id: current_user.id).near(params[:street], 5)
    else
      @solar_panels = SolarPanel.near(params[:street], 5)
    end

    @hash = Gmaps4rails.build_markers(@solar_panels) do |solar_panel, marker|
      marker.lat solar_panel.latitude
      marker.lng solar_panel.longitude
      marker.infowindow render_to_string(partial: "/solar_panels/map_box", locals: { solar_panel: solar_panel })
    end

  end

  def new
    @solar_panel = current_user.solar_panels.new
  end

  def create
    @solar_panel = current_user.solar_panels.new(panel_params)
    @solar_panel.save
    redirect_to user_my_panels_path
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
    params.require(:solar_panel).permit(:size, :efficiency, :price, :address)
  end
end
