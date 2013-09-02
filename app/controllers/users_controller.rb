class UsersController < ApplicationController
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
end
