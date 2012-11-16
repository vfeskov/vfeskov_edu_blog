FactoryGirl.define do
  factory :user do
    name     "Test user"
    email    "testuser@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end