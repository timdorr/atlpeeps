require 'spec_helper'

describe Identity do
  let(:authhash) { OmniAuth::AuthHash.new({provider: 'facebook', uid: '12345', info: {"nickname" => "Tim"}, extra: {"id" => "12345"} }) }

  describe "creates from an omniauth hash" do
    subject { Identity.first_or_create_with_omniauth(authhash) }

    it { expect(subject.provider).to eq("facebook") }
    it { expect(subject.uid).to eq("12345") }
    it { expect(subject.info).to be_a(Hash) }
    it { expect(subject.extra).to be_a(Hash) }
  end
end
