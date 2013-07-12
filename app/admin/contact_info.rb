ActiveAdmin.register ContactInfo do     
  index do
    column :user_id
    column :first_name
    column :last_name
    default_actions
  end

  filter :email

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Admin Details" do
      f.input :user, :collection => User.all.map { |u| u.email }, label: 'User*'
      f.input :first_name
      f.input :last_name
    end
    f.actions
  end
end
