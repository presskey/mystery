require 'rails_helper'

describe BasicAuthentication do

  let(:request) { ActionDispatch::Request.new(env) }
  subject { described_class.new(request).authenticate }

  context "without credentials" do
    let(:env) { {} }

    it { is_expected.to be_guest }
  end

  context "with invalid credentials" do
    let(:env) do
      { "HTTP_AUTHORIZATION" => encode_credentials(Faker::Internet.user_name, Faker::Internet.password) }
    end

    it { is_expected.to be_guest }
  end

  context "with invalid password" do
    let(:user) { create(:user) }

    let(:env) do
      { "HTTP_AUTHORIZATION" => encode_credentials(user.username, Faker::Internet.password) }
    end

    it { is_expected.to be_guest }
  end

  context "with valid credentials" do
    let(:user) { create(:user) }
    
    let(:env) do
      { "HTTP_AUTHORIZATION" => encode_credentials(user.username, user.password) }
    end

    it "returns authenticated user" do
      is_expected.to eq(user)
    end
  end

end
