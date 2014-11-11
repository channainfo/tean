module Api::V1
  class PostsController < BaseController
    def index
      render json: User.all
    end

    def create
      post = Post.new(protected_params)
      if post.save
        head 201
      else
        head 422
      end
    end

    private
    def protected_params
      params.permit(:title, :description)
    end
  end
end
