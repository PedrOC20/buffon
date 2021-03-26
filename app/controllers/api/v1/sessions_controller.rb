class Api::V1::SessionsController < ApplicationController
  skip_before_action :process_token, only: [:create]

  def show
    current_user ? head(:ok) : head(:unauthorized)
  end
  
  def create
    @user = User.active.where(email: params[:email]).first
    if @user&.valid_password?(params[:password])
      jwt = @user.generate_jwt

      render :create, status: :created, locals: { token: jwt }
    else
      render json: { error: 'invalid_credentials' }, status: :unauthorized
    end
  end

  def destroy
    # current_user&.authentication_token = nil
    if nilify_token && current_user.save
      head(:ok)
    else
      head(:unauthorized)
    end
  end

  private

  def nilify_token
    current_user.authentication_token = nil
  end
end