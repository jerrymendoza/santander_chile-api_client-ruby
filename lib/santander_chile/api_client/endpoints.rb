module SantanderChile
  module ApiClient
    AUTH_BASE_URL = "https://apideveloper.santander.cl/sancl/privado/Cliente/v1/"
    BASE_URL = "https://apiper.santander.cl/appper/facade/"
    PRODUCTS = {
      "PATH": "CruceProductoOnline",
      "KEYS_TO": ["DATA", "OUTPUT", "MATRICES", "MATRIZCAPTACIONES", "e1"],
    }
    BALANCE = {
      "PATH": "ConsultaSaldo",
      "KEYS_TO": ["DATA", "AS_TIB_Consulta_Saldo_Response", "OUTPUT", "ESCALARES"],
    }
    MOVEMENTS = {
      "PATH": "Consultas/MvtosYDeposiDocCtas",
      "KEYS_TO": ["DATA", "MovimientosDepositos"],
    }
  end
end
