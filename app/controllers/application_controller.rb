class ApplicationController < ActionController::API
  before_action :process_token
  before_action :user_active?
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :email,
      :first_name,
      :last_name,
      :username,
      :address,
      :fiscal_number,
      :picture,
      :phone_number,
      :birth_date,
      :active,
      :admin,
      :password,
      :password_confirmation,
      :last_sign_in_at
    ])
    devise_parameter_sanitizer.permit(:account_update, keys: [
      :email,
      :first_name,
      :last_name,
      :username,
      :address,
      :fiscal_number,
      :picture,
      :phone_number,
      :birth_date,
      :active,
      :admin,
      :password,
      :password_confirmation,
      :last_sign_in_at
    ])
  end

  def authenticate_user!(options = {})
    head(:unhautorized) unless signed_in?
  end

  def signed_in?
    @user_id.present?
  end

  def process_token
    if request.headers['Authorization'].present?
      begin
        jwt_payload = JWT.decode(request.headers['Authorization'].split(' ')[1].remove('"'), Rails.application.secrets.secret_key_base).first
        @user_id = jwt_payload['id']
        @is_admin = jwt_payload['is_admin']
      rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError => e
        # head :unauthorized
        render json: {message: e.message}, status: 401
      end
    else
      # head :unauthorized
      render json: {message: "NOT AUTHORIZED"}, status: 401
    end
  end

  def current_user
    @current_user ||= User.find(@user_id)
  end

  def user_active?
    head :unhautorized unless current_user.is_active?
  end
end
