module Api::V1
  class RegistrationsController < BaseController
    def create
      user  = User.new(protected_params)
      if user.save
        render json: generate_access_token_for(user: user), status: :created
      else
        render_bad_request
      end

    end

    def generate_access_token_for(user:)
      token = Doorkeeper::AccessToken.create!(
        application_id: doorkeeper_token.application_id,
        resource_owner_id: user.id,
        expires_in: Doorkeeper.configuration.access_token_expires_in
      )

      return {
        access_token: token.token,
        token_type: 'bearer',
        expires_in: token.expires_in
      }
    end

    private

    def protected_params
      params.permit(:first_name, :last_name, :email, :password)
    end

  end
end