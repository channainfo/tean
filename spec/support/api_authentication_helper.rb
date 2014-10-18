module ApiAuthenticationHelper

  extend RSpec::SharedContext

  let(:user){ create(:user) }
  let(:application){ create(:client_application) }
  let(:access_token) { create(:access_token, application: application,
                                             resource_owner_id:  user.id) }
  let(:header_token){ "Bearer #{access_token.token}"}
end