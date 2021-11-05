module SantanderChile
  module ApiClient
    class PaymentsResource < Resource
      DIG_CONTACTS = ["DATA", "Mvld_SP_Consulta_Ult_Destinatarios_Response", "OUTPUT", "MATRICES", "MATRIZ-ULTIMOS-DESTINATARIOS", "e"]

      def contacts
        response = post_request("UltimosDestinatarios", body: body_builder_contacts)
        Collection.from_response(response, dig_keys: DIG_CONTACTS, type: Contact)
      end

      private

      def body_builder_contacts
        with_template "requests/UltimosDestinatarios", client: @client
      end
    end
  end
end
