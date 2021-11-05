module SantanderChile
  module ApiClient
    class Client
      class Configuration
        ATTRIBUTES = %i[
          client_id
          canal_id
          canal_fisico
          canal_logico
          faraday
        ].freeze
        attr_accessor(*ATTRIBUTES)

        def initialize
          self.canal_id = "078"
          self.canal_fisico = "78"
          self.canal_logico = "74"
          self.faraday = ->(faraday) { }
        end

        def validate!
          ATTRIBUTES.each do |key|
            raise "Missing config value for `#{key}`!" if instance_variable_get("@#{key}").nil?
          end
        end
      end
    end
  end
end
