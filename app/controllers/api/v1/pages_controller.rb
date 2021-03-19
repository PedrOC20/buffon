class Api::V1::PagesController < ApplicationController
  def daily
    begin
      @comments = Comment.where(updated_at: (Time.now - 24.hours)..Time.now)

      render json: {status: :ok, message: "SUCCESS", data: @comments}, include: [ user: { only: :username }, player: { only: [:name, :photo] }]
    rescue StandardError => e
      render json: {message: e.message, status: 500}
    end
  end
end