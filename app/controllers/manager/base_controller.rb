# frozen_string_literal: true

module Manager
  class BaseController < ApplicationController
    before_action :check_login
    layout "admin"

    private

    def check_login
      return if current_admin.present?

      redirect_to new_admin_session_path
    end
  end
end
