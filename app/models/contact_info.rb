class ContactInfo < ActiveRecord::Base
  attr_accessible :first_name,
                  :last_name,
                  :home_address,
                  :home_address_2,
                  :home_city,
                  :home_state,
                  :home_zip_code,
                  :phone_main,
                  :twitter_url,
                  :facebook_url,
                  :linkedin_url,
                  :website_url,
                  :biography,
                  :company_name,
                  :company_position, 
                  :company_website,
                  :user_id,
                  :latitude,
                  :longitude
  belongs_to :user
  
  validates_presence_of :user_id

  geocoded_by :gmaps4rails_address
  after_validation :geocode, if: :home_address_changed?
  acts_as_gmappable process_geocoding: false

  def gmaps4rails_address
    "#{self.home_address}, #{self.home_address_2}, #{self.home_city}, #{self.home_state}, #{self.home_zip_code}" 
  end


end
