require_relative 'response'

module Elasticsearch
  module Logstash
    class SearchResponse < Response
      def initialize(raw_json, index = nil)
        super
        @body = map_model_for(index)
      end

      def total
        response.hits.total
      end

      def size
        response.hits.size
      end

      private

      def map_model_for(index)
        response.hits.hits.map(&Registry.model_for(index).method(:new))
      end
    end
  end
end
