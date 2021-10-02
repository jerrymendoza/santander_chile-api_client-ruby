module SantanderChile
  module ApiClient
    class Client
      class Connection
        def initialize(client:, host:)
          @client = client
          @host = host
        end

        attr_accessor :client, :host

        def post(path, body:, headers: {}, login: false)
          response = faraday(login: login).post(path, body, headers) do |request|
            if !login
              request.headers = { "access-token" => @client.token.tokenJWT }.merge(headers)
            end
          end
        end

        def faraday(login)
          Faraday.new(url: host) do |config|
            config.request :url_encoded if login
            config.request :oauth2, client.token.access_token, token_type: :bearer if client.token # TODO check token timeout
            config.request :json if !login
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
