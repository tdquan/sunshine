class ContractsController < ApplicationController

  before_action :set_solar_panel, only: [:new]
  before_action :set_contract, only: [:show, :start_transactions]
  load_and_authorize_resource except: [:new, :index, :create]

  def index
  end

  def index_terminated
  end

  def show
    @transactions = @contract.transactions.limit(30)
    @cum_transfer = @transactions.inject(0){|sum,t| sum + t.excess }.round(2)
    @graph_points = []

    counter = 0
    cum = 0
    @transactions.each do |transaction|
      counter += 1
      cum += transaction.excess
      @graph_points << {x: counter, y: cum.round(2)}
    end
  end


  def new
  end

  def create
    @contract = current_user.contracts.new(
      solar_panel_id: params[:sp_id],
      start_date: DateTime.now
    )
    authorize! :create, @contract
    @contract.save
    @contract.transactions.any? || FetchUsageJob.perform_later(@contract.solar_panel.user.id)
    redirect_to contracts_path

    #FetchUsageJob.perform_later(current_user.id)
  end


  def update
    @contract.end_date = DateTime.now
    @contract.save
    redirect_to dashboard_path
  end

  def start_transactions
    # FetchUsageJob.perform_later(@contract.solar_panel.user.id)
    @transactions = @contract.transactions.limit(30)
    respond_to do |format|
      format.js
    end
    #redirect_to contract_path(@contract)
  end


  private

  def set_solar_panel
    @solar_panel = SolarPanel.find(params[:solar_panel_id])
  end

  def set_contract
    @contract = Contract.find(params[:id])
  end

end
