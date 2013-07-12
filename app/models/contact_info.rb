class ContactInfo < ActiveRecord::Base
  attr_accessible :biography, :company_name, :company_position, :company_website, :facebook_url, :first_name, :home_address, :home_address_2, :home_city, :home_state, :home_zip_code, :last_name, :phone_main, :twitter_url, :website_url, :user_id

  belongs_to :user
  
  validates_presence_of :user_id
end
