# frozen_string_literal: true

module Manager
  class BlogsController < Manager::BaseController

    before_action :load_blog, only: [:edit, :update, :destroy]

    def index
      @blogs = Blog.page(params[:page]).order(created_at: :desc)
    end

    def new
      @blog = Blog.new
    end

    def create
      @blog = current_admin.blogs.build(blog_params)
      if @blog.save
        flash[:success] = "Blog was successfully created"
        redirect_to manager_blogs_path
      else
        render :new
      end
    end

    def edit;end

    def update
      if @blog.update(params[:blog].permit(:title, :content, :image, :description))
        redirect_to manager_blogs_path, success: "Blog was updated!"
      else
        render :edit
      end
    end

    def destroy
      @blog = Blog.find(params[:id])
      if @blog.destroy
       redirect_to manager_blogs_path, success: "Blog was destroyed!"
      end
    end

    private

    def load_blog
      @blog = Blog.find(params[:id])
    end

    def blog_params
      params.require(:blog).permit(:title, :content, :image, :description)
    end
  end
end
