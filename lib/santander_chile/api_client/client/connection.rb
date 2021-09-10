module SantanderChile
  module ApiClient
    class Client
      class Connection
        EXTRA_HEADERS = {
          "app" => "007",
          "canal" => "003",
          "nro_ser" => "",
        }.freeze

        def initialize(client:, host:)
          @client = client
          @host = host
        end

        attr_accessor :client, :host

        def post(path, body: {}, headers: {}, login: false)
          response = faraday(login: login).post(path, body) do |request|
            request.headers = EXTRA_HEADERS.merge(headers)
          end
        end

        def faraday(login:)
          Faraday.new(url: host) do |config|
            config.request :url_encoded if login
            config.request :oauth2, client.token.tokenJWT, token_type: :bearer if client.token
            config.request :json unless login
            config.response :raise_error
            config.response :json, content_type: "application/json"
            client.config.faraday.call(config)
            config.adapter Faraday.default_adapter
          end
        end
      end
    end
  end
end
