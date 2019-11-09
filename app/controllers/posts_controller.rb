class PostsController < ApplicationController
  def index
    @posts = Post.page(params[:page]).per(6).order("created_at DESC")
  end
  
  def show
    @post=Post.find(params[:id])
    @comment=Comment.new
    @comments=@post.comments
  end

  def create
    @posts=Post.new(post_params)
    if post_params[:category_id].present? && post_params[:category_attributes][:category].blank?
        @posts.category_id=post_params[:category_id]
        @posts.save
    elsif post_params[:category_id].present? && post_params[:category_attributes].present?
      render 'new'
    else 
      @posts.save
    end

  end

  def destroy
    @post=Post.find(params[:id])
    @post.destroy
    redirect_to(root_path)
  end

  def new
    @posts = Post.new
    @posts.build_category
  end
  
  def edit
    @post=Post.find(params[:id])
  end

  def update
    @post=Post.find(params[:id])
    if post_params[:category_attributes][:category].present?
      @category=Category.create(category_attributes_params[:category_attributes])
      @post.category_id=nil
      @post.category_id=@category.id
      @post.update(update_params)
      redirect_to(root_path)
    else
      @post.category_id=nil
      @post.category_id= post_params[:category_id]
      @post.update(update_params)
      redirect_to(root_path)
    end
  end

  private

  def post_params
    params.require(:post).permit(
      :title,
      :place,
      :image,
      :text,
      :category_id,
      category_attributes: [
        :id,
        :category
      ]
    ).merge(user_id:current_user.id)
  end

  def update_params
    params.require(:post).permit(
      :title,
      :place,
      :image,
      :text
    )
  end

  def category_attributes_params
    params.require(:post).permit(
      category_attributes: [
        
        :category
      ]
    )
  end
end
