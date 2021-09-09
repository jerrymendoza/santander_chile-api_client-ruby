module SantanderChile
  module ApiClient
    class Client
      module Authentication
        AUTH_BASE_URL = "https://apideveloper.santander.cl/sancl/privado/Cliente/v1/"
        attr_accessor :token

        def login(username:, password:, grant_type: "password")
          self.token = oauth_token(
            grant_type: grant_type,
            client_id: config.client_id,
            scope: "Completa",
            username: username,
            password: password,
          )
        end

        private

        def oauth_token(**body)
          response = connection(host: AUTH_BASE_URL).post(
            "oauth2/token",
            body: body,
            login: true,
          )

          Token.new(response.body)
        end
      end
    end
  end
end
