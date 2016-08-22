class DashboardController < ApplicationController
  def show
    current_user.address = session[:current_user_address]
  end
end
