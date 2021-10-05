module SantanderChile
  module ApiClient
    class Object
      def initialize(attrs)
        self.class::ATTRIBUTES.each { |key, value|
          instance_variable_set("@#{key}", attrs[value])
        }
      end
    end
  end
end
