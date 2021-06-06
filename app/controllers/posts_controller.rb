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
  end

  def update
  end

  def show
    @post = Post.find(params[:id])  
  end
  
  private

  def post_params
    params.require(:post).permit(:fes_name, :impressions, :image).merge(user_id: current_user.id)
  end

end
