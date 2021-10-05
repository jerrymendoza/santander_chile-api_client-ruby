module SantanderChile
  module ApiClient
    class Object
      ATTRIBUTES = {}
      attr_accessor(*ATTRIBUTES.keys.map { |x| x.to_sym })

      def initialize(attrs)
        ATTRIBUTES.each { |key, value|
          instance_variable_set("@#{key}", attrs[value])
        }
      end
    end
  end
end
