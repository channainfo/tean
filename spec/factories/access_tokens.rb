FactoryGirl.define do
  factory :access_token, :class => Doorkeeper::AccessToken do
    resource_owner_id 1
    association :application, factory: :client_application
  end

end