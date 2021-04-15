module Api::V1
  class UsersController < ApplicationController
    before_action :is_current_user?, only: :show
    before_action :check_if_admin?, only: :create

    def create
      @user = User.new(user_params)

      if @user.save
        render json: { status: "SUCCESS", message: "User Created", data: @user.as_json }, status: :created
      else
        render json: { status: 'ERROR', message: 'User Not Created', data: @user.errors.as_json }, status: 422
      end
    end

    def show
      begin
        @user = User.find(params[:id])

        render json: {status: "SUCCESS", message: "User", data: @user.as_json}, status: :ok
      rescue ActiveRecord::RecordNotFound => e
        render json: {message: e.message, status: 500}
      end
    end

    def update
      @user = User.find(params[:id])
  
      if @user.update(user_params)
        render json: { status: 'SUCCESS', message: 'User Updated', data: @user.as_json }, status: :created
      else
        render json: { status: 'ERROR', message: 'User Not Updated', data: @user.errors }, status: 400
      end
    end

    private

    def user_params
      params.require(:user).permit(
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
      )
    end

    def is_current_user?
      unless current_user.id.to_s == params[:id]
        render json: {message: "fdshfaz"}
      end
    end
  end
end
