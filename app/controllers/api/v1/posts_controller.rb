module Api::V1
  class PostsController < BaseController
    def index
      render json: User.all
    end
  end
end