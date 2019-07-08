module Manager
  class CommentsController < Manager::BaseController
    load_and_authorize_resource

    def index
      @comments = Comment.page(params[:page]).order(created_at: :desc)
    end

    def destroy
      @blog = Blog.find(params[:blog_id])
      @comment = @blog.comments.find(params[:id])
      @comment.destroy
      redirect_to manager_blogs_path
    end
  end
end
