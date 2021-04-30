class Api::V1::PagesController < ApplicationController
  def daily
    begin
      @comments = Comment.where(updated_at: (Time.now - 48.hours)..Time.now).order("updated_at desc")

      render json: {
        status: "SUCCESS",
        message: "Last 48H Comments",
        data: @comments.as_json(
          include: [ 
            user: { only: [:username, :picture] },
            player: { only: [:name, :photo] }
          ]
        )
      }, status: :ok
    rescue StandardError => e
      render json: {message: e.message, status: 500}
    end
  end

  def daily_club_requests
    begin
      @club_requests = ClubRequest.where(updated_at: (Time.now - 48.hours)..Time.now).order("updated_at desc")

      render json: {
        status: "SUCCESS",
        message: "Last 48H Club Requests",
        data: @club_requests.as_json(
          include: [ 
            user: { only: [:username, :picture] },
            club: { only: [:name, :logo] }
          ]
        )
      }, status: :ok
    rescue StandardError => e
      render json: {message: e.message, status: 500}
    end
  end
end 