class DashboardController < ApplicationController
  def show
    current_user.update(address: session[:current_user_address])
    sign_in current_user, bypass: true
  end

  def show_neighbour
    current_user.update(address: session[:current_user_address])
    sign_in current_user, bypass: true
  end
end
