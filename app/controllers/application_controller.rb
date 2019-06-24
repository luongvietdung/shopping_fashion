# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :cart
  helper_method :cart

  def cart
    @cart ||= Cart.new(session[:cart])
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:user_name, :full_name, :phone_number, :address,
               :email, :password, :password_confirmation)
    end
  end
end
