
ActiveAdmin.register User do     
  #

  menu :label => "Scholars"

  action_item :only => :index do
    link_to 'Import Scholars', :action => 'upload_scholars'
  end

  #Adds route
  collection_action :upload_scholars do
    render "admin/import/users"
  end

  collection_action :import_scholars, :method => :post do
    ImportUsers.import(params[:spreadsheet])

    redirect_to :action => :index, :notice => "CSV imported successfully!"
  end

  index do
    column :id                     
    column :email
    column("First") { |user| user.contact_info.first_name }
    column("Last") { |user| user.contact_info.last_name }
    column("Undergrad") { |user| user.contact_info.undergrad_school }
    column("Year") { |user| user.contact_info.undergrad_grad_year }
    default_actions
  end

  csv do
    column :email
    column("First") { |user| user.contact_info.first_name }
    column("Last") { |user| user.contact_info.last_name }
    column("Undergrad") { |user| user.contact_info.undergrad_school }
    column("Year") { |user| user.contact_info.undergrad_grad_year }
  end

  filter :email

  index :download_links => false do
  end

  form do |f|
    f.inputs "User Details" do
      f.input :email

      f.inputs do
        f.has_many :contact_info, :heading => 'Contact Info', :new_record => false do |cf|
          cf.input :first_name
          cf.input :last_name
          cf.input :home_address
          cf.input :home_address_2
          cf.input :home_city
          cf.input :home_state
          cf.input :home_zip_code
          cf.input :phone_main
          cf.input :twitter_url
          cf.input :facebook_url
          cf.input :linkedin_url
          cf.input :website_url
          cf.input :biography
          cf.input :company_name
          cf.input :company_position 
          cf.input :company_website
        end
      end
    end
    f.actions
  end

end

