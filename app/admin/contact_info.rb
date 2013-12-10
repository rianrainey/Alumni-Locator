ActiveAdmin.register ContactInfo do
  menu false
  index do
    column :user_id
    column :first_name
    column :last_name
    default_actions
  end

  filter :email

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Admin Details" do
      f.input :user, :collection => User.all.map { |u| [u.email, u.id] }, label: 'User*'
      f.input :first_name
      f.input :last_name
      f.input :home_address
      f.input :home_address_2
      f.input :home_city
      f.input :home_state
      f.input :home_zip_code
      f.input :phone_main
      f.input :twitter_url
      f.input :facebook_url
      f.input :linkedin_url
      f.input :website_url
      f.input :biography
      f.input :company_name
      f.input :company_position 
      f.input :company_website
    end
    f.actions
  end
end
