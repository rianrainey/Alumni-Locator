# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contact_info do
    first_name "Rian"
    last_name "Rainey"
    home_address "123 Main Street"
    home_address_2 "Apt A1"
    home_city "Columbus"
    home_state "OH"
    home_zip_code "12345"
    phone_main ""
    twitter_url "rianrainey"
    facebook_url "http://www.facebook.com/rianrainey"
    website_url "http:/www.rian.me"
    company_name "Built Well Labs"
    company_position "Developer"
    company_website "http://www.builtwelllabs.com"
    biography "I am a developer"
  end
end
