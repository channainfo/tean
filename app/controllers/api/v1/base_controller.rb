module Api::V1
  class BaseController < ActionController::Base
    doorkeeper_for :all
    respond_to :json

    def current_user
      @current_user ||= User.find(doorkeeper_token.resource_owner_id)
    end

    def render_bad_request
      head :bad_request
    end
  end
end