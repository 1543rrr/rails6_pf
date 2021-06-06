class PostsController < ApplicationController
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

  def show
  end
  
  private

  def post_params
    params.require(:post).permit(:fes_name, :impressions, :image).merge(user_id: current_user.id)
  end

end

