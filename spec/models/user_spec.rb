require 'spec_helper'

describe User do
  describe "Associations" do
    it { should have_one :contact_info }
  end

  it "has a Contact Info record" do
    user1 = FactoryGirl.create(:user)
    contact1 = FactoryGirl.create(:contact_info, user_id: user1.id)

    expect(user1.contact_info.id).to eq contact1.id
  end
end
