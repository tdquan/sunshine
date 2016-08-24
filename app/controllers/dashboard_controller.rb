class DashboardController < ApplicationController
  def show
    sign_in current_user, bypass: true
  end

  def show_neighbour
    sign_in current_user, bypass: true
  end
end
