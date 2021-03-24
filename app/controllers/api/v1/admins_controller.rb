class Api::V1::AdminsController < ApplicationController
  before_action :check_if_admin?

  def index
    begin
      @users = User.all

      render json: { status: 'SUCCESS', message: 'Users', data: @users.as_json }, status: :ok
    rescue StandardError => e
      render json: {message: e.message, status: 500}
    end
  end

  private
    
  def check_if_admin?
    unless current_user.is_admin? && @is_admin
      render json: {message: "NOT AUTHORIZED"}, status: 401
    end
  end
end
  