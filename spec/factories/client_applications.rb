AUTH_CODE_CALLBACK_URL = "urn:ietf:wg:oauth:2.0:oob"
FactoryGirl.define do
  factory :client_application, :class => Doorkeeper::Application do
    sequence(:name){|n| "Client App #{n}"}
    redirect_uri AUTH_CODE_CALLBACK_URL
  end
end