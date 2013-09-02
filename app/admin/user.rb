ActiveAdmin.register User do     
  index do                            
    column :id                     
    column :email        
    default_actions                   
  end                                 

  filter :email                       

  form do |f|                         
    f.inputs "User Details" do       
      f.input :email                  

      if !f.object.new_record?

        f.inputs "User's Contact Info", :for => [:contact_info, f.object.contact_info || ContactInfo.new] do |contact_info|
          contact_info.input :first_name
          contact_info.input :last_name
          contact_info.input :home_address
          contact_info.input :home_address_2
          contact_info.input :home_city
          contact_info.input :home_state
          contact_info.input :home_zip_code
          contact_info.input :phone_main
          contact_info.input :twitter_url
          contact_info.input :facebook_url
          contact_info.input :linkedin_url
          contact_info.input :website_url
          contact_info.input :biography
          contact_info.input :company_name
          contact_info.input :company_position 
          contact_info.input :company_website
          contact_info.input :latitude
          contact_info.input :longitude
        end
      end

    end
    f.actions
  end

end

