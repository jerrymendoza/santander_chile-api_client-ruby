RSpec.describe SantanderChile::ApiClient do
  it "has a version number" do
    expect(SantanderChile::ApiClient::VERSION).not_to be nil
  end
  it "has a ENV CLIENT_ID stub" do
    expect(ENV["CLIENT_ID"]).not_to be_nil
  end
end
