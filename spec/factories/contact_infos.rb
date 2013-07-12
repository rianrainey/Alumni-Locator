# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contact_info do
    first_name "MyString"
    last_name "MyString"
    home_address "MyString"
    home_address_2 "MyString"
    home_city "MyString"
    home_state "MyString"
    home_zip_code "MyString"
    phone_main ""
    twitter_url "MyString"
    facebook_url "MyString"
    website_url "MyString"
    company_name "MyString"
    company_position "MyString"
    company_website "MyString"
    biography "MyText"
  end
end
