module SantanderChile
  module ApiClient
    class MovementsResource < Resource
      DIG_RESPONSE = ["DATA", "MovimientosDepositos"]

      def list(account, **params)
        response = post_request("Consultas/MvtosYDeposiDocCtas", body: body_builder(account))
        Collection.from_response(response, dig_keys: DIG_RESPONSE, type: Movement)
      end

      private

      def body_builder(account)
        with_template "requests/MvtosYDeposiDocCtas", client: @client, account: account
      end
    end
  end
end
