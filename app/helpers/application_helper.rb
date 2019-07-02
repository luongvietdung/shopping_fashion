# frozen_string_literal: true

module ApplicationHelper
  def current_class(test_path)
    return "active" if request.path == test_path
  end

  def search_result
    @search_2 = Product.ransack(params[:q])
    @search_result = @search_2.result.page(params[:page]).per(::Settings.products)  
  end

  def filter_result
    @filter = Product.ransack(params[:q])
    @filter.sorts = "price desc" if @filter.sorts.blank?
    @products_filter = @filter.result(distinct: true).page(params[:page]).per(::Settings.products)
  end

  def product_details
    @another_products = Product.limit(::Settings.thumbs).find(Product.pluck(:id))
    @reviews = @product.reviews.order("created_at asc")
  end
  def reviews_build
    @review = @product.reviews.build
  end
end
