require 'elasticsearch'
require_relative 'response'

module Elasticsearch
  module Logstash
    class Client
      attr_reader :client

      def initialize(args = {})
        @client = Elasticsearch::Client.new(args)
      end

      def search(**args)
        Response.new client.search(options(args)), args[:index].to_s.to_sym
      end

      private

      def options(args = {})
        { q: "*", sort: "@timestamp:desc" }.merge args
      end
    end
  end
end
