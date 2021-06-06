class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show] 
  def index
    @posts = Post.all 
  end

  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
    render :new
    end    
  end  

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post)
      else
    render :edit
    end
  end

  def show
    @post = Post.find(params[:id])  
  end
  
  private

  def post_params
    params.require(:post).permit(:fes_name, :impressions, :image).merge(user_id: current_user.id)
  end

end
