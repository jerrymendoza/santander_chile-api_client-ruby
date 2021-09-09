require "spec_helper"

RSpec.describe "Authentication" do
  let(:client) { config_client }
  let(:username) { "00111111111" }
  let(:password) { "1111" }

  context "check login" do
    it "supports the login with username/password" do
      token = client.login(
        username: username,
        password: password,
      )
      expect(token).to raise be_instance_of SantanderChile::ApiClient::Token
    end
  end
end
