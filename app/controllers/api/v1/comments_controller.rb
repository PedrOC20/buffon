class Api::V1::CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @player = Player.find(params[:player_id])
    @comment.player_id = params[:player_id]
    @comment.user = current_user
    if @comment.save
      render json: { status: "SUCCESS", message: "Comment Created", data: @comment }, status: :created
    else
      render json: { status: 'ERROR', message: 'Comment Not Created', data: @comment.errors }, statu: 400
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
