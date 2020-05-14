class Api::V1::ClubsController < ApplicationController
  def index 
    @clubs = Club.all
    # render :index, status: :ok
    render json: { status: 'SUCCESS', message: 'All clubs', data: @clubs }, status: :ok
  end

  def show
    @club = Club.find(params[:id])

    render json: {  status: 'SUCCESS', message: 'Club Showed', data: @club }, status: :ok
  end

  def create
    @club = Club.new(club_params)

    if @club.save
      render json: { status: "SUCCESS", message: "Club created", data: @club }, status: :created
    else
      render json: { status: 'ERROR', message: 'Club Not Saved', data: @club.errors }, status: 422
    end
  end

  def update
    @club = Club.find(params[:id])

    if @club.update(club_params)
      render json: { status: 'SUCCESS', message: 'Club Updated', data: @club }, status: :created
    else
      render json: { status: 'ERROR', message: 'Club not updated', data: @club.errors }, status: 400
    end
  end

  def destroy
    @club = Club.find(params[:id])

    if @club.destroy
      render json: { status: 'SUCCESS', message: 'Club Deleted' }, status: :ok
    else
      render json: { status: 'ERROR', message: 'Club not deleted', data: @club.errors }, status: :unprocessable_entity
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
      :phone_number
    )
  end
end
