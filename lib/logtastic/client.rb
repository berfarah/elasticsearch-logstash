require 'elasticsearch'
require_relative 'search_response'
require_relative 'single_response'

module Logtastic
  class Client
    attr_reader :client

    def initialize(args = {})
      @client = Elasticsearch::Client.new(args)
    end

    def search(**args)
      SearchResponse.new client.search(options(args)), args[:index].to_s.to_sym
    end

    def get(**args)
      SingleResponse.new client.get(**args), args[:index].to_s.to_sym
    end

    private

    def options(args = {})
      { q: "*", sort: "@timestamp:desc" }.merge args
    end
  end
end
