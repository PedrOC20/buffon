class Api::V1::PlayersController < ApplicationController
  def index 
    @players = Player.all

    render :index, status: :ok 
  end

  def create
    @player = Player.new(player_params)

    @player.save
    render :create, status: :created
    # render json: @player, status: :created
  end

  def destroy
    @player = Player.where(id: params[:id]).first
    if @player.destroy
      head(:ok)
    else
      head(:unprocessable_entity)
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
