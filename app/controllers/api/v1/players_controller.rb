class Api::V1::PlayersController < ApplicationController
  def index 
    @players = Player.all

    # render :index, status: :ok
    render json: { status: 'SUCCESS', message: 'All Players', data: @players }, status: :ok
  end

  def show
    @player = Player.find(params[:id])

    render json: {  status: 'SUCCESS', message: 'Player showed', data: @player }, status: :ok
  end

  def create
    @player = Player.new(player_params)

    if @player.save
      render json: { status: "SUCCESS", message: "Player created", data: @player }, status: :created
    else
      render json: { status: 'ERROR', message: 'Player Not Saved', data: @player.errors }, statu: 400
    end
  end

  def update
    @player = Player.find(params[:id])

    if @player.update(player_params)
      render json: { status: 'SUCCESS', message: 'Player Updated', data: @player }, status: :created
    else
      render json: { status: 'ERROR', message: 'Player not updated', data: @player.errors }, status: 400
    end
  end

  def destroy
    @player = Player.find(params[:id])

    if @player.destroy
      render json: { status: 'SUCCESS', message: 'Player Deleted' }, status: :ok
    else
      render json: { status: 'ERROR', message: 'Player not deleted', data: @player.errors }, status: :unprocessable_entity
    end
  end

  private

  def player_params
    params.require(:player).permit(
      :name,
      :birth_date,
      :birthplace,
      :age,
      :height,
      :nacionality,
      :position,
      :foot,
      :manager,
      :current_club,
      :in_team_since,
      :contract_until,
      :equipment,
      :social
    )
  end
end
