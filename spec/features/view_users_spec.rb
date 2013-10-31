require 'spec_helper'
include AuthHelper

describe 'Users Index' do
  subject { page }

  before do
    @person = FactoryGirl.create(:user)
    contact_info = FactoryGirl.create(:contact_info, user_id: @person.id)
    @person.contact_info = contact_info
  end

  context "no search input" do
    before do
      http_login
      visit users_path
    end


    it "displays no users" do
      page.should_not have_content "Access denied"
      page.should_not have_content @person.contact_info.first_name
      page.should_not have_content "Sorry, there were no scholars"
    end
  end

  context "with search near users" do
    before do
      http_login
      visit "/map?search=#{@person.contact_info.home_city}%2C+#{@person.contact_info.home_state}"
    end

    it "displays list of user results within radius of search" do
      page.should have_content @person.contact_info.first_name
    end

  end

  context "with search away from users" do
    before do
      http_login
      visit "/map?search=Mongolia"
    end

    it "does not display users outside of search radius" do
      page.should_not have_content @person.contact_info.first_name
    end
  end

end
