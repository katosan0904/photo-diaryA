class PostsController < ApplicationController
  def index
    @posts = Post.all.order("created_at DESC")
  end
  
  def show
    @post=Post.find(params[:id])
    @comment=Comment.new
    @comments=@post.comments
  end

  def create
    @posts=Post.create(post_params)
  end

  def destroy
    @post=Post.find(params[:id])
    @post.destroy
    redirect_to(root_path)
  end

  def new
    @posts = Post.new
  end
  
  def edit
    @post=Post.find(params[:id])
  end

  def update
    @post=Post.find(params[:id])
    @post.update(post_params)
    redirect_to(root_path)
  end

  private

  def post_params
    params.require(:post).permit(
      :title,
      :place,
      :image,
      :text,
    ).merge(user_id:current_user.id)
  end
end
