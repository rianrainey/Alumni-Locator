class UsersController < ApplicationController
  before_filter :require_password

  def index
    if params[:search].present?
      contacts = ContactInfo.near(params[:search], 50, :order => :distance)
      @json = contacts.to_gmaps4rails do |contact, marker|
        marker.infowindow render_to_string(:partial => "/users/infowindow", locals: { contact: contact})
      end

      user_ids = contacts.map { |c| c.user_id }
      @users = User.find(user_ids)
    else
      @users = User.all
      @json = ContactInfo.all.to_gmaps4rails do |contact, marker|
        marker.infowindow render_to_string(:partial => "/users/infowindow", locals: { contact: contact})
      end
    end

  end

  def login
    
  end

  private
  def require_password
    unless session[:password] == Settings.app_defaults.password
      flash[:error] = Settings.app_defaults.error_not_authorized
    end
  end
end
