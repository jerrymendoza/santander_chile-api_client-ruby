module SantanderChile
  module ApiClient
    class Contact < Object
      ATTRIBUTES = {
        "rut" => "RUT-CLIENTE",
        "name" => "NOMBRE-CLIENTE",
        "account_number" => "NUMERO-CUENTA",
        "account_bank" => "CODIGO-BANCO-CCA",
        "account_type" => "TIPO_CUENTA",
        "email" => "CORREO_ELECTRONICO",
      }

      attr_accessor(*ATTRIBUTES.keys.map { |x| x.to_sym })
    end
  end
end
