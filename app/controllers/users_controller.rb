class UsersController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  def my_panels
    @solar_panels = SolarPanel.where(user_id: current_user.id)
  end

end
