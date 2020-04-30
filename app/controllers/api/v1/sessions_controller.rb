class Api::V1::SessionsController < ApplicationController
  def show
    current_user ? head(:ok) : head(:unauthorized)
  end
  
  def create
    @user = User.where(email: params[:email]).first

    if @user&.valid_password?(params[:password])
      # render json: user.as_json(only: [:id, :email]), status: :created
      jwt = WebToken.encode(@user)

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