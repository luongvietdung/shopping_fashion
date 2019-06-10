# frozen_string_literal: true

module Manager
  class SessionsController < Devise::SessionsController
    layout "admin"

    def after_sign_in_path_for(resource)
      stored_location_for(resource) || manager_root_url
    end
  end
end
