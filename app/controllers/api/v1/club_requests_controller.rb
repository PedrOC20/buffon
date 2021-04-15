class Api::V1::ClubRequestsController < ApplicationController
  before_action :check_if_admin?, only: [:destroy]

  def index
    begin
      @clubs = Club.includes(:club_requests)

      render json: { 
        status: 'SUCCESS', 
        message: 'Club Requests', 
        data: @clubs.as_json(
          include: 
            [:club_requests]
        ) 
      }, status: :ok
    rescue StandardError => e
      render json: {message: e.message, status: 500}
    end
  end

  def show
    begin
      @club_request = ClubRequest.find(params[:id])

      render json: {
        status: 'SUCCESS',
        message: 'Club Request showed',
        data: @club_request.as_json(
          include: [
            user: {only: [:username, :picture]},
            club: {only: [:name, :logo]}
          ]
        )
      }, status: :ok
    rescue ActiveRecord::RecordNotFound => e
      render json: {message: e.message, status: 500}
    end
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
      render json: { status: 'SUCCESS', message: 'Club request Deleted' }, status: 204
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
