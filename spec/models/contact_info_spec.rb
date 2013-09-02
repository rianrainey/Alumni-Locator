require 'spec_helper'

describe ContactInfo do
  it { should belong_to :user }

  it "has a User record" do
    user1 = FactoryGirl.create(:user)
    contact1 = FactoryGirl.create(:contact_info, user_id: user1.id)

    expect(contact1.user.id).to eq user1.id
  end
end
