class Api::V1::Clubs::ClubRequestsController < ApplicationController
  before_action :fetch_club

  def create
    @club_request = ClubRequest.new(club_request_params)
    @club_request.club = @club
    
    if @club_request.save
      render json: { status: "SUCCESS", message: "Club Request created", data: @club_request }, status: :created
    else
      render json: { status: 'ERROR', message: 'Club Request Not Saved', data: @club_request.errors }, status: 422
    end
  end

  private

  def club_request_params
    params.require(:club_request).permit(
      :budget, :salary,
      :position, :description
    )
  end

  def fetch_club
    @club = Club.find(params[:club_id])
  end
end
