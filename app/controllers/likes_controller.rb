class LikesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def create
    unless current_user.liked_by?(clicked_post)
      like = Like.new(user_id: current_user.id, post_id: params[:id])

      if like.save
        flash[:success] = '投稿に「いいね！」しました'
        redirect_back(fallback_location: root_path)
      else
        flash[:alert] = 'すでに「いいね！」しています'
        redirect_back(fallback_location: root_path)
      end
    end
  end

  def destroy
    Like.find_by(user_id: current_user.id, post_id: params[:id]).destroy
    flash[:success] = '「いいね！」を取り消しました'
    redirect_back(fallback_location: root_path)
  end

  private

  def clicked_post
    Post.find(params[:id])
  end

  def post_params
    @post = Post.find(params[:id])
  end
end
