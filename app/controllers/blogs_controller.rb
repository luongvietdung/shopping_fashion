class BlogsController < ApplicationController
  before_action :recent_blogs, only: [:index, :show]
  def index
    @blogs = Blog.all.order(created_at: :desc).page(params[:page]).per(::Settings.blogs)
  end

  def show
    @blog = Blog.find(params[:id])
  end

  private

  def recent_blogs
    @recent_blogs = Blog.last(5).reverse
  end
end
