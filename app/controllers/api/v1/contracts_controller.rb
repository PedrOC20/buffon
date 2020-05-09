class Api::V1::ContractsController < ApplicationController
  def index
    @contracts = Contract.all

    render json: { status: "SUCCESS", message: "All contracts", data: @contracts}, status: :ok
  end

  def show
    @contract = Contract.find(params[:id])

    render json: {  status: 'SUCCESS', message: 'Contract showed', data: @contract }, status: :ok
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
      render json: { status: 'SUCCESS', message: 'Contractt Deleted' }, status: :ok
    else
      render json: { status: 'ERROR', message: 'Contract not deleted', data: @contract.errors }, status: :unprocessable_entity
    end
  end

  private

  def contract_params
    params.require(:contract).permit(:title, :file)
  end
end
