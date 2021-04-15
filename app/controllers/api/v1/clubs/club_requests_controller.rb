class Api::V1::Clubs::ClubRequestsController < ApplicationController
  before_action :fetch_club

  def create
    @club_request = ClubRequest.new(club_request_params)
    @club_request.club = @club
    @club_request.user_id = current_user.id
    
    if @club_request.save
      render json: { 
        status: "SUCCESS", 
        message: "Club Request created", 
        data: @club_request.as_json(
          include: [
            user: { only: [:username, :picture] }
          ]
        )
      }, status: :created
    else
      render json: { status: 'ERROR', message: 'Club Request Not Saved', data: @club_request.errors }, status: 422
    end
  end

  # render json: {
  #   status: "SUCCESS",
  #   message: "Comment Created",
  #   data: @comment.as_json(
  #     include: [ 
  #       user: { only: [:username, :picture] },
  #       player: { only: [:name, :photo] }
  #     ]
  #   )
  # }, status: :created

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
