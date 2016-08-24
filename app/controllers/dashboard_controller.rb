class DashboardController < ApplicationController
  def show_neighbour
    sign_in current_user, bypass: true
    @solar_count= SolarPanel.count
    @user_count= User.count
  end
end
