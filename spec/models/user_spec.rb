require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.create(:user) }

  it "requires a name" do
    expect(user).to be_valid

    user.name = nil
    expect(user).not_to be_valid
  end
end
