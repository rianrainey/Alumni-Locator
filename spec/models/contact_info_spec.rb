require 'spec_helper'

describe ContactInfo do
  it { should belong_to :user }

  it "has a User record" do
    user1 = FactoryGirl.create(:user)
    contact1 = FactoryGirl.create(:contact_info, user_id: user1.id)

    expect(contact1.user.id).to eq user1.id
  end

  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:undergrad_school) }
  it { should respond_to(:undergrad_grad_year) }
  it { should respond_to(:home_address) }
  it { should respond_to(:home_address_2) }
  it { should respond_to(:home_city) }
  it { should respond_to(:home_state) }
  it { should respond_to(:home_zip_code) }
  it { should respond_to(:phone_main) }
  it { should respond_to(:linkedin_url) }
  it { should respond_to(:twitter_url) }
  it { should respond_to(:facebook_url) }
end
