class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :destroy]
  def show
    @posts=Post.where(category_id: @category.id).page(params[:page]).per(6).order("created_at DESC")
  end

  def destroy
    @category.instead_of_category
    @category.reload
    @category.destroy
    redirect_to(:back)
  end

  private

  def set_category
    @category=Category.find(params[:id])
  end

end
