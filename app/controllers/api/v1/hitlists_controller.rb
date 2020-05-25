class Api::V1::HitlistsController < ApplicationController
  def index 
    @players = Player.where("player_type LIKE ?", "%Hitlist%")
    
    # render :index, status: :ok
    render json: { status: 'SUCCESS', message: 'Hitlist Players', data: @players }, status: :ok
  end
end
