module SantanderChile
  module ApiClient
    class Resource
      attr_reader :client

      def initialize(client)
        @client = client
      end

      private

      def post_request(url, body: {}, headers: {})
        handle_response client.connection.post(url, body: body, headers: headers)
      end

      def build_cabecera_body(custom_name = "cabecera")
        { "#{custom_name}": {
          "HOST": {
            "USUARIO-ALT":  "GHOBP",
            "TERMINAL-ALT": "",
            "CANAL-ID":     client.config.canal_id,
          },
          "CanalFisico": client.config.canal_fisico,
          "CanalLogico": client.config.canal_logico,
          "RutCliente":  client.username,
          "RutUsuario":  client.username,
          "IpCliente":   "",
          "InfoDispositivo": "xx",
        } }
      end

      def handle_response(response)
        case response.status
        when 400
          raise Error, "Your request was malformed. #{response.body["error"]}"
        when 401
          raise Error, "You did not supply valid authentication credentials. #{response.body["error"]}"
        when 403
          raise Error, "You are not allowed to perform that action. #{response.body["error"]}"
        when 404
          raise Error, "No results were found for your request. #{response.body["error"]}"
          #when 429
          #  raise Error, "Your request exceeded the API rate limit. #{response.body["error"]}"
        when 500
          raise Error, "We were unable to perform the request due to server-side problems. #{response.body["error"]}"
          #when 503
          #  raise Error, "You have been rate limited for sending more than X requests per second. #{response.body["error"]}"
        end

        response
      end
    end
  end
end
