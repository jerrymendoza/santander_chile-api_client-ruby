module SantanderChile
  module ApiClient
    class ProductsResource < Resource
      ## PATHS on santander_chile/api_client/endpoints.rb
      def products_params(username)
        {
          "cabecera" => { "RutUsuario" => username },
          "INPUT" => { "NUMERODOCUMENTO" => username },
        }
      end

      def list(**params)
        response = post_request(PRODUCTS[:PATH], body: products_params(@client.username).to_json)
        Collection.from_response(response, keys_to: PRODUCTS[:KEYS_TO], type: Account)
      end
    end
  end
end
