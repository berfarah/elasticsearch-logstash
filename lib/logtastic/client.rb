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
      model = model_from(args)
      SearchResponse.new client.search(options(args)), model
    end

    def get(**args)
      model = model_from(args)
      SingleResponse.new client.get(**args), model
    end

    private

    def model_from(args = {})
      model = args.delete(:model) || args[:index] || args[:type]
      model.to_s.to_sym
    end

    def options(args = {})
      { sort: "@timestamp:desc" }.merge args
    end
  end
end
