require 'transfer_market_scraper'

class Api::V1::PlayersController < ApplicationController
  def index 
    begin
      @players = Player.where("player_type LIKE ?", "%Client%")

      render json: {status: "SUCESS", message: "Clients", data: @players.as_json}, status: :ok
    rescue StandardError => e
      render json: {message: e.message, status: 500}
    end
  end

  def show
    begin
      @player = Player.find(params[:id])

      render json: {status: "SUCESS", message: "Player", data: @player.as_json(:include => [:comments, :evaluation])}, status: :ok
    rescue ActiveRecord::RecordNotFound => e
      render json: {message: e.message, status: 500}
    end
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
      render json: { status: "SUCCESS", message: "Player", data: @player }, status: :created
    else
      render json: { status: 'ERROR', message: 'Player Not Created', data: @player.errors }, status: 422
    end
  end

  def update
    @player = Player.find(params[:id])

    if @player.update(player_params)
      render json: { status: 'SUCCESS', message: 'Player Updated', data: @player }, status: :created
    else
      render json: { status: 'ERROR', message: 'Player Not Updated', data: @player.errors }, status: 400
    end
  end

  def destroy
    @player = Player.find(params[:id])

    if @player.destroy
      render json: { status: 'SUCCESS', message: 'Player Deleted' }, status: :ok
    else
      render json: { status: 'ERROR', message: 'Player Not deleted', data: @player.errors }, status: :unprocessable_entity
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
