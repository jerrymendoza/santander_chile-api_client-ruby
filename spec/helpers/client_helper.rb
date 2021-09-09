module ClientHelper
  def config_client
    SantanderChile::ApiClient::Client.new do |config|
      config.client_id = "un_client-id_muy_bueno_para_el_test"
    end
  end
end
