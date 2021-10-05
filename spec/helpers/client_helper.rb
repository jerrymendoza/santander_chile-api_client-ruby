module ClientHelper
  def config_client
    SantanderChile::ApiClient::Client.new do |config|
      config.client_id = ENV['CLIENT_ID']
    end
  end
end
