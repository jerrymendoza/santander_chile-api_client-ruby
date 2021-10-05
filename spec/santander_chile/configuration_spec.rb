require "spec_helper"

RSpec.describe "Configuration" do
  let(:client) { config_client }
  let(:client_id) { ENV["CLIENT_ID"] }
  let(:client_id_malo) { "un_client-id_muy_malo_para_el_test" }
  context "check config" do
    it "client_id is set" do
      expect(client.config.client_id).not_to be_nil
    end
    it "client_id is equal to given" do
      expect(client.config.client_id).to eq client_id
    end
  end
end
