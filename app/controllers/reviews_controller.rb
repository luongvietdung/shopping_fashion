class ReviewsController < ApplicationController
  before_action :check_login
  def new
    @review = Review.new
  end

  def create
    @product = Product.find(review_params[:product_id])
    @review = current_user.reviews.build(review_params)
    @review.save
    respond_to do |format|
      format.js
    end
    @reviews = @product.reviews.page(params[:page]).per(10)
  end

  private

  def review_params
    params.require(:review).permit( :content, :rate, :product_id) 
  end

  def check_login
    unless user_signed_in?
      session[:forwarding_url] = request.referrer
      redirect_to new_user_session_path
    end
  end
end

