class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  def create
    @comment = Comment.new(comment_params)
    if @comment.valid?
      @comment.save
    end
      redirect_to post_path(@comment.post)
  end

  def destroy
    @comment = comment.find(params[:id])
    @comment.destroy
    redirect_to post_path(@comment.post)
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
  end

end
