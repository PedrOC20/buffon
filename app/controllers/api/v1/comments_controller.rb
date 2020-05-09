class Api::V1::CommentsController < ApplicationController
  def index
    @comments = Comment.all

    render json: { status: "SUCCESS", message: "All comments", data: @comments}, status: :ok
  end

  def show
    @comment = Comment.find(params[:id])

    render json: {  status: 'SUCCESS', message: 'Comment showed', data: @comment }, status: :ok
  end

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

  def destroy
    @comment = Comment.find(params[:id])

    if @comment.destroy
      render json: { status: 'SUCCESS', message: 'Comment Deleted' }, status: :ok
    else
      render json: { status: 'ERROR', message: 'Comment not deleted', data: @comment.errors }, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
