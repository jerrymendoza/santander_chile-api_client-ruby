module SantanderChile
  module ApiClient
    class Collection
      attr_reader :data

      def initialize(data:)
        @data = data
      end

      def self.from_response(response, keys_to:, type:)
        body = response.body
        new(
          data: body.dig(*keys_to).map {
            |attrs|
            type.new(attrs)
          },
        )
      end
    end
  end
end
