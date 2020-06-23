require 'transfer_market'

class Api::V1::PlayersController < ApplicationController
  def index 
    @players = Player.where("player_type LIKE ?", "%Clients%")
    # render :index, status: :ok
    render json: { status: 'SUCCESS', message: 'Client Players', data: @players }, status: :ok
  end

  def show
    @player = Player.find(params[:id])

    render json: @player.to_json(:include => [:comments, :evaluation]), status: :ok
    # render json: {  status: 'SUCCESS', message: 'Player showed', data: @player.to_json(:include => [:comments, :evaluation]) }, status: :ok
  end

  def create
    @player = Player.new(player_params)

    if @player.player_url.empty?
      @player
    else
      player_info = TransferMarketScraper.scrape(@player.player_url)
      @player.name = player_info[:nickname]
      @player.full_name = player_info[:complete_name]
      @player.photo = player_info[:photo]
      @player.birth_date = player_info[:birth_date]
      @player.birthplace = player_info[:birthplace]
      @player.height = player_info[:height]
      @player.nacionality = player_info[:nationality]
      @player.position = player_info[:position]
      @player.foot = player_info[:foot]
      @player.manager = player_info[:manager]
      @player.current_club = player_info[:current_club]
      @player.in_team_since = player_info[:in_team_since]
      @player.contract_until = player_info[:contract_until]
    end

    if @player.save
      render json: { status: "SUCCESS", message: "Player created", data: @player }, status: :created
    else
      render json: { status: 'ERROR', message: 'Player Not Saved', data: @player.errors }, status: 422
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
      :social,
      :player_url,
      :photo,
      :player_type,
      :full_name,
      :tax_number,
      :address,
      :passport_number,
      :email,
      :weight,
      :position_2,
      :position_3,
      :internal_agent,
      :agent_contract_expires,
      :sponsor,
      :phone_number
    )
  end
end
