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
      SearchResponse.new client.search(options(args)), model(args)
    end

    def get(**args)
      SingleResponse.new client.get(**args), model(args)
    end

    private

    def model(args = {})
      model = args[:model] || args[:index] || args[:type]
      model.to_s.to_sym
    end

    def options(args = {})
      { sort: "@timestamp:desc" }.merge args
    end
  end
end
