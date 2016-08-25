class DashboardController < ApplicationController

  def show
    @number_of_simulations = current_user.contracts.joins( :transactions ).group( 'contracts.id' ).having( 'count( contract_id ) > 1' ).length
  end

  def show_neighbour
    sign_in current_user, bypass: true
    @solar_count= SolarPanel.count
    @user_count= User.count
  end
end
