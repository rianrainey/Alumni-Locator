# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    contact_info { FactoryGirl.create(:contact_info) }
    password "password"
    password_confirmation "password"
  end
end
