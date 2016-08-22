class SolarPanelsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]
  load_and_authorize_resource except: [:index, :new, :create, :show_my, :addUserAddress]


  def index
    @user = current_user
    @solar_panels = SolarPanel.near(@user ? @user.address : params[:street], 1)

    @solar_panels += User.near(params[:street], 1)

    @hash = Gmaps4rails.build_markers(@solar_panels) do |solar_panel, marker|
      marker.lat solar_panel.latitude
      marker.lng solar_panel.longitude
      marker.infowindow render_to_string(partial: "/solar_panels/map_box", locals: { solar_panel: solar_panel })
    end

  end

  def new
    @solar_panel = current_user.build_solar_panel
  end

  def create
    @solar_panel = current_user.build_solar_panel(panel_params)
    authorize! :create, @solar_panel
    if @solar_panel.save
      redirect_to my_panel_path
    else
      render :new
    end

  end

  def show
    @contract = @solar_panel.contracts.build
  end

  def show_my
    @solar_panel = current_user.solar_panel
  end

  def destroy
  end


  def addUserAddress
    session[:return_to] ||= request.referer
    @user = current_user
    @user.address = user_params[:address]
    @user.save
    redirect_to session.delete(:return_to)
  end


  private

  def user_params
    params.require(:user).permit(:address)
  end


  def panel_params
    params.require(:solar_panel).permit(:size, :efficiency, :price, :address)
  end
end
