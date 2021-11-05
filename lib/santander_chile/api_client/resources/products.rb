module SantanderChile
  module ApiClient
    class ProductsResource < Resource
      DIG_RESPONSE = ["DATA", "OUTPUT", "MATRICES", "MATRIZCAPTACIONES", "e1"]

      def list(**params)
        response = post_request("CruceProductoOnline", body: body_builder)
        Collection.from_response(response, dig_keys: DIG_RESPONSE, type: Account)
      end

      private

      def body_builder
        with_template "requests/CruceProductoOnline", client: @client
      end
    end
  end
end
