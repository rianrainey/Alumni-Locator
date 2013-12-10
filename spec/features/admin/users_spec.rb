require 'spec_helper'
include AuthHelper

describe 'index' do
  let!(:u) { FactoryGirl.create(:user) }

  before do
    log_into_administration
    visit admin_users_path
  end

  it 'has the correct columns' do
    expect(page).to have_content 'Email'
    expect(page).to have_content 'First'
    expect(page).to have_content 'Last'
    expect(page).to have_content 'Undergrad'
    expect(page).to have_content 'Year'
  end

  it "has the user's info" do
    expect(page).to have_content(u.email)
    expect(page).to have_content(u.contact_info.first_name)
    expect(page).to have_content(u.contact_info.last_name)
    expect(page).to have_content(u.contact_info.undergrad_school)
    expect(page).to have_content(u.contact_info.undergrad_grad_year)
  end
end
