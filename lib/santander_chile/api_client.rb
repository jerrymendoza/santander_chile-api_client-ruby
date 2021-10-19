require "faraday"
require "faraday_middleware"
require "santander_chile/api_client/version"
require "santander_chile/api_client/endpoints"

module SantanderChile
  module ApiClient
    autoload :Error, "santander_chile/api_client/error"
    autoload :Token, "santander_chile/api_client/token"

    autoload :Object, "santander_chile/api_client/models/object"
    autoload :Account, "santander_chile/api_client/models/account"
    autoload :Collection, "santander_chile/api_client/collection"

    autoload :Resource, "santander_chile/api_client/resources/resource"
    autoload :ProductsResource, "santander_chile/api_client/resources/products"

    class Client
      autoload :Configuration, "santander_chile/api_client/client/configuration"
      autoload :Connection, "santander_chile/api_client/client/connection"
      autoload :Authentication, "santander_chile/api_client/client/authentication"

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
      end
    end
  end
end
