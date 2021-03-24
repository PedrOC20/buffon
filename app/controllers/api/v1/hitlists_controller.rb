class Api::V1::HitlistsController < ApplicationController
  def index 
    begin
      @players = Player.where("player_type LIKE ?", "%Hitlist%")
      
      render json: { status: 'SUCCESS', message: 'Hitlist Players', data: @players.as_json }, status: :ok
    rescue StandardError => e
      render json: {message: e.message, status: 500}
    end
  end
end
