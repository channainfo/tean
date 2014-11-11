require 'spec_helper'
require 'rspec_api_documentation/dsl'

resource 'Registrations' do
  before(:each) do
    header "Authorization", header_token
  end

  post 'api/v1/registrations' do
    parameter :first_name, "First name", require: true
    parameter :last_name, "Last name", require: true
    parameter :email, "Email", require: true
    parameter :password, "Password", require: true

    example 'register a user' do
      do_request(first_name: 'Channa', last_name: 'Ly', email: 'channa.info@gmail.com', password: '123456')
      expect(status).to eq 201
      expect(JSON.parse(response_body)).to include('access_token', 'token_type', 'expires_in')
    end

  end
end