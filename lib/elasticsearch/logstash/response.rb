require 'json'
require 'hashie'
require_relative 'registry'

module Elasticsearch
  module Logstash
    class ResponseWrapper < Hashie::Mash
    end

    class Response
      attr_reader :raw_json, :response, :body
      alias_method :to_s, :raw_json

      def initialize(raw_json, type = nil)
        @raw_json = raw_json
        @response = ResponseWrapper.new raw_json
        @body     = model_for(type)
      end

      def total
        response.hits.total
      end

      def size
        response.hits.size
      end

      def as_json(*)
        body
      end

      def to_json(*)
        as_json.to_json
      end

      private

      def model_for(index)
        response.hits.hits.map(&Registry.model_for(index).method(:new))
      end
    end
  end
end
