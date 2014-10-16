FactoryGirl.define do
  factory :user do
    first_name "MyString"
    last_name "MyText"
    sequence(:email){|n| "channa.info+#{n}@gmail.com"}
    password "123456"
  end
end