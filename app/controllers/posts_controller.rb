class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, except: [:index, :show, :new, :create, :edit, :search, :update, :destroy]
  def index
    @posts = Post.all 
  end

  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = '投稿が完了しました'
      redirect_to root_path
    else
      flash.now[:danger] = "投稿に失敗しました"
    render :new
    end    
  end  

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = '投稿を削除しました'
    redirect_to root_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post)
      flash[:success] = '投稿を編集しました'
      else
    render :edit
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.includes(:user)  
  end
  
  def search
    @posts = Post.search(params[:keyword])
  end

  private

  def post_params
    params.require(:post).permit(:fes_name, :impressions, :image).merge(user_id: current_user.id)
  end

  def set_users
    @users = Users.find(post_params)
  end
end
