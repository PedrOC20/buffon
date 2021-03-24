class Api::V1::ContractsController < ApplicationController
  def index
    begin
      @contracts = Contract.all

      render json: { status: "SUCCESS", message: "Contracts", data: @contracts}, status: :ok
    rescue StandardError => e
      render json: {message: e.message, status: 500}
    end
  end

  def show
    begin
      @contract = Contract.find(params[:id])

      render json: {  status: 'SUCCESS', message: 'Contract', data: @contract }, status: :ok
    rescue ActiveRecord::RecordNotFound => e
      render json: {message: e.message, status: 500}
    end
  end

  def create
    @contract = Contract.new(contract_params)
    @player = Player.find(params[:player_id])
    @contract.player_id = params[:player_id]
    # @contract.user = current_user
    if @contract.save
      render json: { status: "SUCCESS", message: "Contract Created", data: @contract }, status: :created
    else
      render json: { status: 'ERROR', message: 'Contract Not Created', data: @contract.errors }, statu: 400
    end
  end

  def destroy
    @contract = Contract.find(params[:id])

    if @contract.destroy
      render json: { status: 'SUCCESS', message: 'Contract Deleted' }, status: :ok
    else
      render json: { status: 'ERROR', message: 'Contract Not Deleted', data: @contract.errors }, status: :unprocessable_entity
    end
  end

  private

  def contract_params
    params.require(:contract).permit(:title, :file)
  end
end
