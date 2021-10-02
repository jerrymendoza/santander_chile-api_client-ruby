require "ostruct"

module SantanderChile
  module ApiClient
    class Client
      module Authentication
        attr_accessor :token, :username
        HEADERS = {
          "app" => "007",
          "canal" => "003",
          "nro_ser" => "",
        }

        def login(username:, password:, grant_type: "password")
          self.username = username
          self.token = oauth_token(
            grant_type: grant_type,
            client_id: config.client_id,
            scope: "Completa",
            username: username,
            password: password,
          )
          self.token
        end

        private

        def oauth_token(**body)
          response = connection(host: AUTH_BASE_URL).post(
            "oauth2/token",
            body: body,
            headers: HEADERS,
            login: true,
          )

          return Token.new(response.body)
        end
      end
    end
  end
end
