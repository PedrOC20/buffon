require 'club_transfer_market'

class Api::V1::ClubsController < ApplicationController
  def index 
    begin
      @clubs = Club.all

      render json: { status: 'SUCCESS', message: 'Clubs', data: @clubs.as_json }, status: :ok
    rescue StandardError => e
      render json: {message: e.message, status: 500}
    end
  end

  def show
    begin
      @club = Club.find(params[:id])

      render json: {  status: 'SUCCESS', message: 'Club', data: @club.as_json(:include => [:contacts, :club_requests]) }, status: :ok
    rescue ActiveRecord::RecordNotFound => e
      render json: {message: e.message, status: 500}
    end
  end

  def create
    @club = Club.new(club_params)

    if @club.club_url.empty?
      @club
    else
      club_info = ClubTransferMarket.scrape(@club.club_url)
      @club.name = club_info[:name]
      @club.address = club_info[:address]
      @club.phone_number = club_info[:phone_number]
      @club.founded = club_info[:founded]
      @club.website = club_info[:website]
      @club.logo = club_info[:logo]
    end

    if @club.save
      render json: { status: "SUCCESS", message: "Club Created", data: @club }, status: :created
    else
      render json: { status: 'ERROR', message: 'Club Not Created', data: @club.errors }, status: 422
    end
  end

  def update
    @club = Club.find(params[:id])

    if @club.update(club_params)
      render json: { status: 'SUCCESS', message: 'Club Updated', data: @club }, status: :created
    else
      render json: { status: 'ERROR', message: 'Club Not Updated', data: @club.errors }, status: 400
    end
  end

  def destroy
    @club = Club.find(params[:id])

    if @club.destroy
      render json: { status: 'SUCCESS', message: 'Club Deleted' }, status: :ok
    else
      render json: { status: 'ERROR', message: 'Club Not Deleted', data: @club.errors }, status: :unprocessable_entity
    end
  end

  private

  def club_params
    params.require(:club).permit(
      :name,
      :logo,
      :founded,
      :address,
      :email,
      :president,
      :website,
      :phone_number,
      :club_url
    )
  end
end
