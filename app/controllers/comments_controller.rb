class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  def create
    @comment = Comment.new(comment_params)
    if @comment.valid?
      @comment.save
      flash[:notice] = 'コメント投稿が完了しました'
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
def create
  @post = Post.new(post_params)
  if @post.save
    flash[:notice] = '投稿が完了しました'
    redirect_to posts_path
  else
    flash.now[:alert] = "投稿に失敗しました"
  render :new
  end    
end  