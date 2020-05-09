class Api::V1::EvaluationsController < ApplicationController
  def index
    @evaluations = Evaluation.all

    render json: { status: "SUCCESS", message: "All evaluations", data: @evaluations}, status: :ok
  end

  def show
    @evaluation= Evaluation.find(params[:id])

    render json: {  status: 'SUCCESS', message: 'Evaluation showed', data: @evaluation}, status: :ok
  end

  def create
    @evaluation = Evaluation.new(evaluation_params)
    @player = Player.find(params[:player_id])
    @evaluation.player_id = params[:player_id]
    # @evaluation.user = current_user
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
      render json: { status: 'ERROR', message: 'Evaluation not deleted', data: @evaluation.errors }, status: :unprocessable_entity
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
