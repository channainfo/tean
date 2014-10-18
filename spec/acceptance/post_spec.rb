require 'spec_helper'
require 'rspec_api_documentation/dsl'

resource "Posts" do
  get '/api/v1/posts' do
    example 'Listing posts' do
      do_request
      expect(status).to eq 200
    end
  end

end