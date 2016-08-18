class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :welcome_step1, :welcome_step2, :create]
  def home
  end

  def welcome_step1
    @user=User.new
  end

  def create
    session[:current_user_address] = params[:user][:address]
    redirect_to welcome_step2_path
  end

  def welcome_step2
    @solar_panels = SolarPanel.near(session[:current_user_address], 1)
    @best_panel = @solar_panels.first
    @hash = Gmaps4rails.build_markers(@solar_panels) do |solar_panel, marker|
      marker.lat solar_panel.latitude
      marker.lng solar_panel.longitude
      marker.infowindow render_to_string(partial: "/solar_panels/map_box", locals: { solar_panel: solar_panel })
    end
  end



end
