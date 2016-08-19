class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only:
  [:home, :welcome_step0, :welcome_step1, :welcome_step2, :create_step0, :create_step1]
  def home
  end

  def welcome_step0
    @user=User.new
  end

  def create_step0
    session[:current_user_first_name] = params[:user][:first_name]
    redirect_to welcome_step1_path
  end

  def welcome_step1
    @user=User.new
  end

  def create_step1
    session[:current_user_address] = params[:user][:address]
    email = "a#{User.last.email}"
    user = User.create(first_name: session[:current_user_first_name], address: session[:current_user_address], password: "123456", email: email)
    sign_in(user)
    redirect_to welcome_step2_path
  end

  def welcome_step2
    @solar_panels = SolarPanel.near(session[:current_user_address], 1)
    @count_panels = @solar_panels.length
    @best_panel = @solar_panels.first
    @hash = Gmaps4rails.build_markers(@solar_panels) do |solar_panel, marker|
      marker.lat solar_panel.latitude
      marker.lng solar_panel.longitude
      marker.infowindow render_to_string(partial: "/solar_panels/map_box", locals: { solar_panel: solar_panel })
    end
  end



end
