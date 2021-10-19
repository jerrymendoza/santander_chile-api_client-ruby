module SantanderChile
  module ApiClient
    class MovementsResource < Resource
      ## PATHS on santander_chile/api_client/endpoints.rb
      def movements_params(client, account)
        {
          "Cabecera" => {
            "HOST" => {
              "USUARIO-ALT" => "GHOBP",
              "TERMINAL-ALT" => "",
              "CANAL-ID" => "078",
            },
            "CanalFisico" => "78",
            "CanalLogico" => "74",
            "RutCliente" => client.username,
            "RutUsuario" => client.username,
            "IpCliente" => "",
            "InfoDispositivo" => "xx",
          },
          "Entrada" => {
            "NumeroCuenta" => account.account_number,
          },
        }
      end

      def list(account, *params)
        response = post_request(MOVEMENTS[:PATH], body: movements_params(@client, account).to_json)
        Collection.from_response(response, keys_to: MOVEMENTS[:KEYS_TO], type: Movement)
      end
    end
  end
end
