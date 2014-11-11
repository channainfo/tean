require 'spec_helper'
require 'rspec_api_documentation/dsl'

describe User do
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password).on(:create) }
  it { should validate_uniqueness_of(:email).on(:create) }
end