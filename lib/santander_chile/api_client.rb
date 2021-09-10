require "faraday"
require "faraday_middleware"
require "santander_chile/api_client/version"

module SantanderChile
  module ApiClient
    autoload :Error, "santander_chile/api_client/error"
    autoload :Token, "santander_chile/api_client/token"

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

      def connection(host:)
        Connection.new(client: self, host: host)
      end
    end
  end
end
