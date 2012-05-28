FactoryGirl.define do
  factory :user do
    name "Michael Hartl"
    email "michael@example.com"
    password "foobar"
    password_confirmation "foobar"
  end

  factory :user_unmatched_pwd do
    name "Test User"
    email "test@example.com"
    password "foobar"
    password_confirmation "unmatched"

  end
end
