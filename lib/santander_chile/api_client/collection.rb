module SantanderChile
  module ApiClient
    class Collection
      include Enumerable
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

      def each(*args, &block)
        @data.each(*args, &block)
      end
    end
  end
end
