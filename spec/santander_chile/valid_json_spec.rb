require "spec_helper"

RSpec.describe "Templates" do
  context "check valid" do
    SantanderChile::ApiClient::Template::TEMPLATES.each { |key, value|
      it "valid #{key} template" do
        template_file = File.read(value)
        expect(valid_json?(template_file)).to be true
      end
    }
  end
end
