require "santander_chile/api_client/version"

module SantanderChile
  module ApiClient
    autoload :Configuration, "santander_chile/api_client/client/configuration"
    autoload :Error, "santander_chile/api_client/error"

    class Client
      attr_accessor :config

      def initialize
        self.config = Configuration.new
        yield(config) if block_given?
        config.validate!
      end
    end
  end
end
