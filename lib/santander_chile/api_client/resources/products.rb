module SantanderChile
  module ApiClient
    class ProductsResource < Resource
      ## PATHS on santander_chile/api_client/endpoints.rb
      DIG_RESPONSE = ["DATA", "OUTPUT", "MATRICES", "MATRIZCAPTACIONES", "e1"]

      def list(**params)
        response = post_request("CruceProductoOnline", body: body_builder().to_json)
        Collection.from_response(response, dig_keys: DIG_RESPONSE, type: Account)
      end

      private

      def body_builder(**params)
        body = build_cabecera_body()
        body.merge(input())
      end

      def input
        { "INPUT": { "NUMERODOCUMENTO": @client.username } }
      end
    end
  end
end
