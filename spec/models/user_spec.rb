require 'rails_helper'

describe User do
  
  it { is_expected.to validate_presence_of(:username) }
  it { is_expected.to validate_uniqueness_of(:username) }
  it { is_expected.to validate_presence_of(:password) }

  describe "#admin?" do
    subject { user.admin? }

    context "when user is admin" do
      let(:user) { create(:user, :admin) }
      it { is_expected.to be true }
    end

    context "when user is not admin" do
      let(:user) { create(:user) }
      it { is_expected.to be false }
    end

    context "when admin flag set but user is not persisted" do
      let(:user) { build(:user, :admin) }
      it { is_expected.to be false }
    end
  end

  describe "#guest?" do
    subject { user.guest? }

    context "when user is not persisted" do
      let(:user) { build(:user) }
      it { is_expected.to be true }
    end

    context "when user is persisted" do
      let(:user) { create(:user) }
      it { is_expected.to be false }
    end
  end

end
