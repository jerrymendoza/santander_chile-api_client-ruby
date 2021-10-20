module SantanderChile
  module ApiClient
    class Movement < Object
      ATTRIBUTES = {
        "record_type" => "TipReg",
        "transaction_number" => "NumMov",
        "code" => "Codigo",
        "amount" => "Importe",
        # "" => "Concepto",
        "post_date" => "FechConta",
        "transaction_date" => "FechOper",
        "transaction_time" => "HoraOper",
        #"" => "FechValor",
        #"" => "Cheque",
        "balance" => "NuevoSaldo",
        # "" => "IndAomo",
        # "" => "IndAct",
        # "" => "IndAnulab",
        # "" => "IndAnulado",
        # "" => "IndCargabo",
        # "" => "IndGiro",
        # "" => "Codigur",
        # "" => "TipoCambio",
        # "canal" => "Canal",
        # "" => "IndPpal",
        # "" => "Transaccion",
        # "" => "CodAplicac",
        # "" => "TermNio",
        # "" => "FechNio",
        # "" => "HoraNio",

        "ConcepAmp" => "ConcepAmp",
        "CodigoAmp" => "CodigoAmp",
        "EntidadUmo" => "EntidadUmo",
        "CentroUmo" => "CentroUmo",
        "UseridUmo" => "UseridUmo",
        "CajeroUmo" => "CajeroUmo",

        "annotation" => "Observa",
        "reference" => "ReferMvto",
      # "" => "TipDep",
      # "" => "DivDep",
      # "" => "CentroDep",
      # "" => "NumPapeleta",
      # "" => "IndRetEsp",
      # "" => "TimeUmo",

      }

      attr_accessor(*ATTRIBUTES.keys.map { |x| x.to_sym })
    end
  end
end
