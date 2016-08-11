class ContractsController < ApplicationController

  before_action :set_solar_panel, only: [:new, :create]

  def index_terminated
  end

  def show
    @contract = Contract.find(params[:id])
  end


  def new
  end

  def create
    @contract = @solar_panel.contracts.new
    @contract.user_id = current_user.id
    @contract.start_date = DateTime.now
    @contract.save
    redirect_to user_dashboard_path
  end


  def terminate
    @contract = Contract.find(params[:id])
    @contract.end_date = DateTime.now
    @contract.save
    redirect_to user_dashboard_path
  end


  private

  def set_solar_panel
    @solar_panel = SolarPanel.find(params[:solar_panel_id])
  end

end
