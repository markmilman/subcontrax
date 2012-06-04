FactoryGirl.define do

  factory :user do
    sequence(:name) { |n| "MiYa#{n}" }
    sequence(:email) { |n| "miya_#{n}@example.com" }
    password "foobar"
    password_confirmation "foobar"
    factory :admin do
      admin true
    end
  end

  #factory :admin do
  #  sequence(:name) { |n| "MiYa#{n}" }
  #  sequence(:email) { |n| "miya_#{n}@example.com" }
  #  password "foobar"
  #  password_confirmation "foobar"
  #  admin true
  #end

  factory :user_unmatched_pwd do
    name "Test User"
    email "test@example.com"
    password "foobar"
    password_confirmation "unmatched"

  end
end
