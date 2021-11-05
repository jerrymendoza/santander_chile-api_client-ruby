module SantanderChile
  module ApiClient
    class Client
      AUTH_BASE_URL = "https://apideveloper.santander.cl/sancl/privado/Cliente/v1/"
      BASE_URL = "https://apiper.santander.cl/appper/facade/"

      include Authentication
      attr_accessor :config

      def initialize
        self.config = Configuration.new
        yield(config) if block_given?
        config.validate!
      end

      def connection(host: BASE_URL)
        Connection.new(client: self, host: host)
      end

      def products
        ProductsResource.new(self).list
      end

      def movements(account)
        MovementsResource.new(self).list(account)
      end

      def contacts
        PaymentsResource.new(self).contacts.data
      end
    end
  end
end
