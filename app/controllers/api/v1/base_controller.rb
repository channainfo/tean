module Api::V1
  class BaseController < ActionController::Base
    doorkeeper_for :all
    respond_to :json
  end
end