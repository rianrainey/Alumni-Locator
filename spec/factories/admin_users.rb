# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :admin_user do
    sequence(:email) { |n| "eldauser#{n}@mailinator.com" }
    password "password"
    password_confirmation "password"
  end
end
