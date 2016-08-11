class ContractsController < ApplicationController

  before_action :set_solar_panel

  def new

  end

  def create
    @contract = @solar_panel.contracts.new
    @contract.user_id = current_user
    @contract.save
    redirect_to user_dashboard_path
  end


  private

  def set_solar_panel
    @solar_panel = SolarPanel.find(params[:solar_panel_id])
  end

end
