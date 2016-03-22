require_relative 'response'

module Elasticsearch
  module Logstash
    class GetResponse < Response
      def initialize(raw_json, index = nil)
        super
        @body = model_for(index)
      end

      def total
        response.hits.total
      end

      def size
        response.hits.size
      end

      private

      def model_for(index)
        Registry.model_for(index).new(response)
      end
    end
  end
end
