require 'spec_helper'
require 'rspec_api_documentation/dsl'

resource "Posts" do
  before(:each) do
    header "Authorization", header_token
  end

  get '/api/v1/posts' do
    example 'Listing posts' do
      do_request
      expect(status).to eq 200
    end
  end

  post '/api/v1/posts' do
    example "Creating an post" do
      do_request(title: "testing", description: "testing")
      status.should == 201
    end

  end

end
