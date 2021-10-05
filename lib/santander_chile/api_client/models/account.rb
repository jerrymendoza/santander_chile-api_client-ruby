module SantanderChile
  module ApiClient
    class Account < Object
      ATTRIBUTES = { "account_number" => "NUMEROCONTRATO",
                     "product" => "PRODUCTO",
                     "subproduct" => "SUBPRODUCTO",
                     "balance" => "CUPO",
                     "balance_available" => "MONTODISPONIBLE" }

      attr_accessor(*ATTRIBUTES.keys.map { |x| x.to_sym })
    end
  end
end
