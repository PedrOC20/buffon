class Api::V1::PagesController < ApplicationController
  def daily
    @comments = Comment.where(updated_at: (Time.now - 24.hours)..Time.now)

    render json: {status: "SUCCESS", messsage: "Last 24 comments", data: @comments}, status: :ok 
  end
end