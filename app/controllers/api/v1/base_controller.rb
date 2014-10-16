module Api::V1
  class BaseController < ::ApplicationController
    doorkeeper_for :all
    respond_to :json
  end
end