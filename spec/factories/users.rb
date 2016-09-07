FactoryGirl.define do
  factory :user do
    email { |n| "#testuser-{n}@example.com" }
    password 'password'
  end
end
