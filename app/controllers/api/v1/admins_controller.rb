class Api::V1::AdminsController < ApplicationController
  before_action :check_if_admin?

  def index
    @users = User.all

    # render json: @clubs.to_json(:include => [:club_requests]), status: :ok
    render json: { status: 'SUCCESS', message: 'Users', data: @users }, status: :ok
  end

  private
    
  def check_if_admin?
    current_user.is_admin?
  end
end
  