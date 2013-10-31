require 'spec_helper'
include AuthHelper

describe UsersController do

  context 'Visitor is not authenticated' do
    describe 'Get #index' do
      it 'is forbidden' do
        visit users_path
        page.should have_content "Access denied"
      end
    end
  end

  context 'Visitor is authenticated' do
    before do
      http_login
    end

    describe "Get '#index'" do
      it "should be successful" do
        visit users_path 
        response.code.should eq "200"
      end
    end
  end
end
