require "spec_helper"

RSpec.describe "Authentication" do
  let(:client) { config_client }
  let(:username) { ENV["USERNAME"] }
  let(:password) { ENV["PASSWORD"] }

  context "check login" do
    it "supports the login with username/password" do
      token = client.login(
        username: username,
        password: password,
      )
      expect(token).to be_instance_of SantanderChile::ApiClient::Token
    end
  end
end
