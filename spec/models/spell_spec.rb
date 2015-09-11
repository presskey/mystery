require 'rails_helper'

describe Spell do

  it { is_expected.to belong_to(:user) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to have_many(:ingredients).dependent(:destroy) }

  describe "#owner" do
    let(:user)  { create(:user) }
    let(:spell) { create(:spell, user: user) }
    subject { spell.owner }

    it "returns spell owner" do
      is_expected.to be user
    end
  end

  describe "#owner=" do
    let(:user)  { create(:user) }
    let(:spell) { create(:spell) }
    subject { spell.owner = user }

    it "sets spell owner" do
      subject
      expect(spell.owner).to eq user
    end
  end

  it_behaves_like "ownable", :spell

end
