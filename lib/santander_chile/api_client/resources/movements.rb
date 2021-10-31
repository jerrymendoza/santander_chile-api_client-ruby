module SantanderChile
  module ApiClient
    class MovementsResource < Resource
      DIG_RESPONSE = ["DATA", "MovimientosDepositos"]

      def list(account, **params)
        response = post_request("Consultas/MvtosYDeposiDocCtas", body: body_builder(account).to_json)
        Collection.from_response(response, dig_keys: DIG_RESPONSE, type: Movement)
      end

      private

      def body_builder(account)
        body = build_cabecera_body("Cabecera")
        body.merge(input(account))
      end

      def input(account)
        { "Entrada": { "NumeroCuenta": account.account_number } }
      end
    end
  end
end
