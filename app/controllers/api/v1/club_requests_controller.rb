class Api::V1::ClubRequestsController < ApplicationController
  def index
    @clubs = Club.includes(:club_requests)

    render json: { status: 'SUCCESS', message: 'Club Requests', data: @clubs }, status: :ok
  end

  def show
    @club_request = ClubRequest.find(params[:id])

    render json: { status: 'SUCCESS', message: 'Club Request showed', data: @club_request}, status: :ok
  end

  def update
    @club_request = ClubRequest.find(params[:id])
    
    if @club_request.update(club_request_params)
      render json: { status: 'SUCCESS', message: 'Club request Updated', data: @club_request }, status: :created
    else
      render json: { status: 'ERROR', message: 'Club request not updated', data: @club_request.errors }, status: 400
    end
  end

  def destroy
    @club_request = ClubRequest.find(params[:id])
    @club = @club_request.club
    
    if @club_request.destroy
      render json: { status: 'SUCCESS', message: 'Club request Deleted' }, status: :ok
    else
      render json: { status: 'ERROR', message: 'Club request not deleted', data: @club_request.errors }, status: :unprocessable_entity
    end
  end

  private

  def club_request_params
    params.require(:club_request).permit(
      :budget, :salary,
      :position, :description
    )
  end
end
