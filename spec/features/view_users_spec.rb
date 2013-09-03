require 'spec_helper'

describe 'Users Index' do
  subject { page }

  before do
    visit users_path
  end

  context 'Visitor is not authenticated' do
    it "displays error message" do
      page.should have_content Settings.app_defaults.error_not_authorized
    end
  end
end
