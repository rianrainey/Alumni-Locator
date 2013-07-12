class CreateContactInfos < ActiveRecord::Migration
  def change
    create_table :contact_infos do |t|
      t.string :first_name
      t.string :last_name
      t.string :home_address
      t.string :home_address_2
      t.string :home_city
      t.string :home_state
      t.string :home_zip_code
      t.string :linkedin_url 
      t.string :phone_main
      t.string :twitter_url
      t.string :facebook_url
      t.string :website_url
      t.string :company_name
      t.string :company_position
      t.string :company_website
      t.text :biography

      t.timestamps
    end
  end
end
