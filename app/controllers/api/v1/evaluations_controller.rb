class Api::V1::EvaluationsController < ApplicationController
  def index
    begin
      @evaluations = Evaluation.all

      render json: { status: "SUCCESS", message: "Evaluations", data: @evaluations}, status: :ok
    rescue StandardError => e
      render json: {message: e.message, status: 500}
    end
  end

  def show
    begin
      @evaluation= Evaluation.find(params[:id])

      render json: {  status: 'SUCCESS', message: 'Evaluation', data: @evaluation}, status: :ok
    rescue ActiveRecord::RecordNotFound => e
      render json: {message: e.message, status: 500}
    end
  end

  def create
    @evaluation = Evaluation.new(evaluation_params)
    @player = Player.find(params[:player_id])
    @evaluation.player_id = params[:player_id]
    @evaluation.user = current_user
    
    if @evaluation.save
      render json: { status: "SUCCESS", message: "Evaluation Created", data: @evaluation }, status: :created
    else
      render json: { status: 'ERROR', message: 'Evaluation Not Created', data: @evaluation.errors }, statu: 400
    end
  end

  def destroy
    @evaluation = Evaluation.find(params[:id])

    if @evaluation.destroy
      render json: { status: 'SUCCESS', message: 'Evaluation Deleted' }, status: :ok
    else
      render json: { status: 'ERROR', message: 'Evaluation Not Deleted', data: @evaluation.errors }, status: :unprocessable_entity
    end
  end

  private

  def evaluation_params
    params.require(:evaluation).permit(
      :ball_control,
      :passing,
      :dribling,
      :heading,
      :finishing,
      :attack,
      :defense,
      :endurance,
      :speed,
      :agility,
      :strength,
      :drive,
      :aggressiveness,
      :determination,
      :responsability,
      :leadership,
      :self_confidence,
      :mental_toughness,
      :coachability,
      :set_pieces
    )
  end
end
