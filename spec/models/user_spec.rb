require 'spec_helper'

describe User do
  describe "Associations" do
    it { should have_one :contact_info }
  end

  describe "Attributes" do
    it { should respond_to :email }
  end

end
