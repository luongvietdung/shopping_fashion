# frozen_string_literal: true

module Manager
  class SessionsController < Devise::SessionsController
    layout "admin"
  end
end
