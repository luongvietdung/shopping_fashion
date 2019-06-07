# frozen_string_literal: true

module Manager
  class BaseController < ApplicationController
    before_action :authenticate_admin!
    layout "admin"
  end
end
