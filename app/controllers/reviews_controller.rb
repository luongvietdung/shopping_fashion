# frozen_string_literal: true

class ReviewsController < ApplicationController
  
  def new
    @review = Review.new
  end

  def create
    @product = Product.find(review_params[:product_id])
    @review = current_user.reviews.build(review_params)
    @review.save
    @reviews = @product.reviews.page(params[:page]).per(10)
    respond_to do |format|
      format.js
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rate, :product_id)
  end
end
